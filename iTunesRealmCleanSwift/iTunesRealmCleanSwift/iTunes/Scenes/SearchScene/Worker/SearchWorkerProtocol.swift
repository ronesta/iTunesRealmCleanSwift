//
//  SearchWorkerProtocol.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import UIKit

protocol SearchWorkerProtocol {
    func searchAlbums(with term: String, completion: @escaping (Result<[RealmAlbum], Error>) -> Void)
    func getImageData(for album: RealmAlbum) -> Data?
}
