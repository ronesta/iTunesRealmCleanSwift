//
//  AlbumWorker.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import UIKit

final class AlbumWorker: AlbumWorkerProtocol {
    var storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func loadAlbumDetails(with album: AlbumModels.Request, completion: @escaping (UIImage?) -> Void) {
        guard let imageData = storageManager.fetchImageData(forImageId: Int(album.album.artistId)),
              let image = UIImage(data: imageData) else {
            completion(nil)
            return
        }

        completion(image)
    }
}
