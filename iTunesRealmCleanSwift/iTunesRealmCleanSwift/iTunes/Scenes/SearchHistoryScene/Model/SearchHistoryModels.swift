//
//  SearchHistoryModels.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation

enum SearchHistoryModels {
    struct Request {
    }

    struct Response {
        let history: [String]
    }

    struct ViewModel {
        let history: [String]
    }
}
