//
//  SearchTerm.swift
//  iTunesRealmCleanSwift
//
//  Created by Ибрагим Габибли on 18.02.2025.
//

import Foundation
import RealmSwift

final class SearchTerm: Object {
    @objc dynamic var term: String = ""

    override static func primaryKey() -> String? {
        return "term"
    }
}
