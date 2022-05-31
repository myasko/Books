//
//  CartPresenter.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import Foundation

protocol CartPresenterProtocol {
    var booksInCart: [Book] { get set }
    func  appendBookInCart(book: Book)
}

class CartPresenter: CartPresenterProtocol {
    var view: CartViewController!
    var booksInCart: [Book] = [
        Book(id_book: 1, author: "Сапковский", name: "Темнее черного", volume: "567", age_limit: "13+", data_creation: "19.01.1567", annotation: "dsjknvjksfnbkjsfnkjsnvjwnfbjlnwsirnvwbnbjfnvwoirvhrvbhwbvdhwbwkrbkwndjvbjsvervbj`b`dskjvberjvbkjbvebrhekjnvoenbrakjnvkjnvjznjvbrjebajbndjnvajfnbkjernbkjafnkjnvaejrnbkjenajnvjenjbnaljnvljnlrjnOWENFWrnbjknvWNVKJNERKNAEVIORNGANJKBKJNVLNANRNEJAVNJERNVAERNBUNAJNEJANRJVNNhfhfhfhfhvjsnarkjbljvnaldvlnbanljndvjwnvjernrballvawirgjebnakvkjanenawrnbkaejnkanrnvabeubnknljnwanvoaernoaegnnjvnwafnawnvsvlbnaelbneroiabnibnoernboeabnwornbafnrofnerfobaonnaoirbr", price: 50, poster: "dima", genre: ["драма", "комедия"]),
        Book(id_book: 13, author: " Дженнифер Ли Арментроут", name: "Искушение", volume: "", age_limit: "", data_creation: "", annotation: "вадцатидвухлетняя Айви не просто студентка колледжа Нового Орлеана. Она – член тайного Ордена, который защищает людей от вторжения злобных эльфов.Ее жизнь полна утрат: в сражениях с врагом погибли родители и возлюбленный. Айви закрыла свое сердце для новых страданий. Пока не появился Рен с его хищным, дьявольским обаянием и его тайнами.", price: 229, poster: "iskuwenie", genre: ["Фэнтези"]),
        Book(id_book: 7, author: "Лия Арден ", name: "Мара и Морок", volume: "", age_limit: "", data_creation: "", annotation: "Таких, как я, называют Марами – отмеченными самой богиней смерти Мораной. Когда-то у меня и моих шести сестер был свой путь.Тогда люди нас уважали и просили о милосердии. Они приносили нам подношения и молились нам. Но 200 лет назад все изменилось, когда принц Серата осмелился поднять руку на одну из нас.Я пыталась отомстить, но погибли мы все. Теперь правители Аракена, погрязшие в длительной войне со своим соседом Сератом, решили вернуть меня к жизни. Дать второй шанс на месть и свободу, привязав меня к тому, против кого я никогда не пойду. Таких, как он, называют Морок, и их боятся абсолютно все.", price: 279, poster: "mara", genre: ["Фэнтези"])
    ]
    
    init(view: CartViewController) {
        self.view = view
    }
    
    func getTotalPrice() -> Int{
        var totalPrice = 0
        for book in booksInCart {
            totalPrice += book.price
        }
        return totalPrice
    }
    
    func removeBookFromCart(index: Int) {
        booksInCart.remove(at: index)
    }
    
    func appendBookInCart(book: Book) {
        booksInCart.append(book)
    }
    
    func getBooks() -> [Book] {
        booksInCart
    }
}
