//
//  Search.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation

enum Search {
    struct Request {
        var searchTerm: String
    }

    struct Response {
        var albums: [RealmAlbum]
    }

    struct ViewModel {
        var albums: [RealmAlbum]
    }
}
