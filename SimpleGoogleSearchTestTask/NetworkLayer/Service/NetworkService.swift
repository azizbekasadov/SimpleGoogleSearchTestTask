//
//  NetworkService.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

protocol NetworkServiceProtocol {
    var baseURL: URL? { get }
    
    func fetchData<T: Decodable>(from path: String,
                                 completion: @escaping (Result<T, Error>) -> Void)
}
