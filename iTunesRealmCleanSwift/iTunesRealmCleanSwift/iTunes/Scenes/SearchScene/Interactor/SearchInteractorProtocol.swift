//
//  SearchInteractorProtocol.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import UIKit

protocol SearchInteractorProtocol {
    func searchAlbums(request: Search.Request)
    func getAlbumImage(for album: RealmAlbum, completion: @escaping (Data?) -> Void)
}
