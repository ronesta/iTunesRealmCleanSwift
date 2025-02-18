//
//  SearchInteractor.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import UIKit

final class SearchInteractor: SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol
    var worker: SearchWorkerProtocol

    init(presenter: SearchPresenterProtocol,
         worker: SearchWorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func searchAlbums(request: Search.Request) {
        worker.searchAlbums(with: request.searchTerm) { [weak self] result in
            switch result {
            case .success(let albums):
                let response = Search.Response(albums: albums)
                self?.presenter.presentAlbums(response: response)
            case .failure(let error):
                self?.presenter.presentError(error.localizedDescription)
                print("Error fetching albums: (error.localizedDescription)")
            }
        }
    }

    func getAlbumImage(for album: RealmAlbum, completion: @escaping (Data?) -> Void) {
        let data = worker.getImageData(for: album)
        completion(data)
    }
}
