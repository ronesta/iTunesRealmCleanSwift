//
//  AlbumModels.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import UIKit

enum AlbumModels {
    struct Request {
        var album: RealmAlbum
    }

    struct Response {
        var album: RealmAlbum
        var image: UIImage
    }

    struct ViewModel {
        var album: RealmAlbum
        var image: UIImage
    }
}
