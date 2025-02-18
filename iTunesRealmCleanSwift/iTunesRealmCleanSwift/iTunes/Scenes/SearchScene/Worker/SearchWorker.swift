//
//  SearchWorker.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import UIKit

final class SearchWorker: SearchWorkerProtocol {
    var networkManager: NetworkManagerProtocol
    var storageManager: StorageManagerProtocol

    init(networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    func searchAlbums(with term: String, completion: @escaping (Result<[RealmAlbum], Error>) -> Void) {
        let savedAlbums = storageManager.fetchAlbums(for: term)

        guard savedAlbums.isEmpty else {
            completion(.success(savedAlbums))
            return
        }

        networkManager.loadAlbums(albumName: term) { [weak self] result, error  in
            if let error {
                print("Error getting albums: \(error)")
                return
            }

            guard let result else {
                return
            }

            var albumsToSave: [(album: Album, imageData: Data)] = []
            let group = DispatchGroup()

            result.forEach { res in
                group.enter()
                self?.networkManager.loadImage(from: res.artworkUrl100) { data, error in
                    if let error {
                        print("Failed to load image: \(error)")
                        return
                    }

                    guard let data else {
                        print("No data for image")
                        return
                    }

                    albumsToSave.append((album: res, imageData: data))
                    group.leave()
                }
            }

            group.notify(queue: .main) { [weak self] in
                guard let self else {
                    return
                }

                storageManager.saveAlbums(albumsToSave, for: term)
                print("Successfully loaded \(albumsToSave.count) albums.")

                DispatchQueue.main.async {
                    let albums = self.storageManager.fetchAlbums(for: term)
                    completion(.success(albums))
                }
            }
        }
    }

    func getImageData(for album: RealmAlbum) -> Data? {
        storageManager.fetchImageData(forImageId: Int(album.artistId))
    }
}
