//
//  BookDetailsPresenter.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import Foundation


class BookDetailsPresenter {
    let view: BookDetailsViewController!
    var book: BookDetails!
    
    required init(view: BookDetailsViewController, book: Book) {
        self.view = view
        self.book = self.createBookDetails(book)
    }
    
    private func createBookDetails(_ book: Book) -> BookDetails {
        return BookDetails(id_book: book.id_book,
                           author: book.author,
                           name: book.name,
                           age_limit: book.age_limit,
                           annotation: book.annotation,
                           price: book.price,
                           poster: book.poster,
                           genre: book.genre
        )
    }
    
    func getBookDetails() -> BookDetails {
        return self.book
    }
}
