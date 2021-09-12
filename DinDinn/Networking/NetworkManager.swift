//
//  NetworkManager.swift
//  DinDinnTest
//
//  Created by apple on 10/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import Moya
import RxSwift


//Liat of api...
protocol Networkable {
    var provider: MoyaProvider<API> { get }

    func googleSearchResults(searchString : String, completion : @escaping (Result<GoogleSearchAddress, Error>) -> ())
}




class NetworkManager: Networkable {
    
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func googleSearchResults(searchString : String, completion: @escaping (Result<GoogleSearchAddress, Error>) -> ()) {
        request(target: .googleSearchPlace(searchText: searchString), completion: completion)
    }
}




private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        
        provider.request(target) { (responce) in
            switch responce {
            case .success(let respo):
                do {
                    let results = try JSONDecoder().decode(T.self, from: respo.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
}
