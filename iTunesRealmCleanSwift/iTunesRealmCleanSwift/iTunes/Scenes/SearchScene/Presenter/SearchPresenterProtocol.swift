//
//  SearchPresenterProtocol.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation

protocol SearchPresenterProtocol {
    func presentAlbums(response: Search.Response)
    func presentError(_ message: String)
}
