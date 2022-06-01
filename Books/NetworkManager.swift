//
//  NetworkManager.swift
//  Books
//
//  Created by Георгий Бутров on 31.05.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func get<T:Codable>(ofType: T.Type, requestAction: String, completion: @escaping (Result<T?, Error>) -> Void)
    func formRequest (url: String) -> URLRequest?
}

final class NetworkManager: NetworkManagerProtocol {
    private let requestURL = "https://morning-spire-27925.herokuapp.com/"
    private var requestAction: String!
    
    func get<T:Codable>(ofType: T.Type, requestAction: String, completion: @escaping (Result<T?, Error>) -> Void){
        guard let request = formRequest(url: requestURL + requestAction) else {return}
        URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode(ofType, from: data!)
                completion(.success(obj))
                print("suc")
            }
            catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func formRequest(url: String) -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        
        let request = URLRequest(url: url)
        
        return request
    }
}
