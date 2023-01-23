//
//  BookSearchTask.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

protocol BookSearchTaskProtocol {
    typealias FetchBooksResult = ((Result<[BookEntity], Error>) -> Void)
    func fetchBooks(by searchPrompt: String?, completion: @escaping FetchBooksResult)
}

struct BookSearchTask: BookSearchTaskProtocol {
    func fetchBooks(by searchPrompt: String?,
                    completion: @escaping FetchBooksResult) {
        let url = "volumes"
        let service = NetworkService()
        service.fetchData(from: url, completion: completion)
    }
}
