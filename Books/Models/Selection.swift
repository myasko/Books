//
//  Selection.swift
//  Books
//
//  Created by Георгий Бутров on 26.04.2022.
//

import Foundation

struct Selection {
    let name: String
    let poster: String
    let books: [Book]
}

struct Selections {
    let selections: [Selection]
}

struct Collection: Codable {
    let id_collection: Int?
    let name: String?
    let photo_collection: String?
    let id_book: [Int]?
}

struct Collections: Codable {
    let collections: [Collection]?
}
