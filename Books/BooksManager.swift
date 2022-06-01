//
//  NetworkManager.swift
//  Books
//
//  Created by Георгий Бутров on 28.05.2022.
//

import Foundation

protocol BooksManagerProtocol {
    var output: BooksManagerOutput? { get set }
    var networkManager: NetworkManagerProtocol! { get }
    func load<T:Codable>(ofType: T.Type, requestAction: String)
    
}

protocol BooksManagerOutput: AnyObject {
    func success<T>(result: T)
    func failure(error: Error)
}

final class BooksManager: BooksManagerProtocol {
    static let shared: BooksManagerProtocol = BooksManager(networkManager: NetworkManager())
    
    weak var output: BooksManagerOutput?
    let networkManager: NetworkManagerProtocol!
    
    
    private init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    
    
    func load<T:Codable>(ofType: T.Type, requestAction: String) {
        self.networkManager.get(ofType: T.self, requestAction: requestAction){[weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let items):
                    self.output?.success(result: items)

            case .failure(let error):
                self.output?.failure(error: error)
            }
        }
    }
}
