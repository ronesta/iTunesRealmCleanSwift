//
//  AlbumAssembly.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import UIKit

final class AlbumAssembly {
    static func build(with album: RealmAlbum) -> UIViewController {
        let storageManager = StorageManager()

        let presenter = AlbumPresenter()
        let worker = AlbumWorker(storageManager: storageManager)
        let interactor = AlbumInteractor(presenter: presenter,
                                         worker: worker
        )
        let viewController = AlbumViewController(interactor: interactor,
                                                 album: album
        )

        presenter.viewController = viewController

        return viewController
    }
}
