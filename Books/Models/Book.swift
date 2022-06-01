//
//  Book.swift
//  Books
//
//  Created by Георгий Бутров on 26.04.2022.
//

import Foundation



struct Book: Codable {
    let id_book: Int?
    let author: String?
    let name: String?
    let annotation: String?
    let price: Int?
    let book_cover: String?
    //let genre: [Int]?
}

struct Books: Codable {
    let books: [Book]?
}


