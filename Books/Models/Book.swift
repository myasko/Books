//
//  Book.swift
//  Books
//
//  Created by Георгий Бутров on 26.04.2022.
//

import Foundation

struct Book {
    let id_book: Int
    let author: String
    let name: String
    let volume: String
    let age_limit: String
    let data_creation: String
    let annotation: String
    let price: Int
    let poster: String
    let genre: [String]
}

struct BookDetails {
    let id_book: Int
    let author: String
    let name: String
    let age_limit: String
    let annotation: String
    let price: Int
    let poster: String
    let genre: [String]
}

