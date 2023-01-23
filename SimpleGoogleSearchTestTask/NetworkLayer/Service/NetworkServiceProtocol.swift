//
//  NetworkServiceProtocol.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

final class NetworkService: NSObject {
    var baseURL = URL(string: "https://www.googleapis.com/books/v1")
    
    var httpMethod: HttpMethod = .get
}

extension NetworkService: NetworkServiceProtocol {
    
    func fetchData<T: Decodable>(from path: String,
                      completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = baseURL?.appendingPathExtension(path) else {
            completion(.failure(AppError.init()))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod.rawValue
        request.setValue(UUID().uuidString, forHTTPHeaderField: "X-Request-ID")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(AppError()))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


