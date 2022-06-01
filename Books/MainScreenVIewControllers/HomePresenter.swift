//
//  HomePresenter.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var output: HomePresetnerOutput? { get set }
    var selections: [Selection] { get set }
    var popularBooks: [Book] { get set }
    func setUpData()
}

protocol HomePresetnerOutput: AnyObject {
    func success()
    func failure()
}

final class HomePresenter: HomePresenterProtocol {

    
    weak var view: HomeViewControllerProtocol!
    weak var output: HomePresetnerOutput?

    var popularBooks: [Book] = []
    var selections: [Selection] = []
    private var allBooks: [Book] = []
    private var allCollections: [Collection] = []
    
    private var bookManger: BooksManagerProtocol =  BooksManager.shared
    
    init(view: HomeViewControllerProtocol) {
        self.view = view
        //self.getAllBooks()
        //self.getAllCollections()
    }
    
    func setUpData() {
        getAllBooks2(requestAction: "books/")
        getAllCol2(requestAction: "api/collections/")
        
        print(selections.count)
        print(allBooks.count)
        print("setUp")
    }
    
}

extension HomePresenter {
    
    func getAllCol2(requestAction: String) {
        bookManger.load(ofType: [Collection].self, requestAction: requestAction)
        bookManger.output = self
    }
    
    func getAllBooks2(requestAction: String) {
        bookManger.load(ofType: [Book].self, requestAction: requestAction)
        bookManger.output = self
    }
    
//    func getAllCollections() {
//        guard let url = URL(string: "https://morning-spire-27925.herokuapp.com/api/collections/") else {return}
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "er")
//                return
//            }
//            do {
//                self.allCollections = try JSONDecoder().decode([Collection].self, from: data)
//                print("collections succsesd")
//                self.setUpData()
//            } catch let err {
//                print(err.localizedDescription)
//            }
//        }.resume()
//    }
//
//    func getAllBooks(){
//        guard let url = URL(string: "https://morning-spire-27925.herokuapp.com/books/") else {return}
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "er")
//                return
//            }
//            do {
//                let books = try JSONDecoder().decode([Book].self, from: data)
//                self.allBooks = books
//                print("books succsesd")
//            } catch let err {
//                print(err.localizedDescription)
//            }
//        }.resume()
//    }

    func convertIdBookToBooks(collection: Collection, books: [Book]) -> [Book] {
        var booksId = collection.id_book ?? []
        var booksInSlection: [Book] = []
        books.forEach { book in
            if book.id_book == booksId.first {
                booksInSlection.append(book)
                booksId.removeFirst()
            }
        }
        return booksInSlection
    }

    func convertCollectionToSelection(collection: Collection) -> Selection {
        let selection = Selection(name: collection.name ?? "Selection",
                                  poster: collection.photo_collection ?? "",
                                  books: convertIdBookToBooks(collection: collection, books: allBooks))
        return selection
    }
}

extension HomePresenter: BooksManagerOutput {
    func success<T>(result: T) {
        if let result = result as? [Book] {
            self.allBooks = result
            self.output?.success()
        } else if let result = result as? [Collection] {
            self.allCollections = result
            self.allCollections.forEach { collection in
                self.selections.append(convertCollectionToSelection(collection: collection))
            }
            self.output?.success()
        }
    }
    
    func failure(error: Error) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.output?.failure()
        }
    }
}
