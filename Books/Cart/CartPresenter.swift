//
//  CartPresenter.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import Foundation

protocol CartPresenterProtocol: AnyObject {
    var booksInCart: [Book] { get } 
    //func  appendBookInCart(book: Book)
}

class CartPresenter: CartPresenterProtocol {
    var view: CartViewController!
    public var booksInCart: [Book] = []
    
    init(view: CartViewController) {
        self.view = view
        
    }
    
    func getTotalPrice() -> Int{
        var totalPrice = 0
        for book in booksInCart {
            totalPrice += book.price!
        }
        return totalPrice
    }
    
    func removeBookFromCart(index: Int) {
        booksInCart.remove(at: index)
    }
    
    func appendBookInCart() {
        booksInCart.append(UserDefaults.standard.object(forKey: "cart") as! Book)
    }
    
    func getBooks() -> [Book] {
        booksInCart
    }
}
