//
//  DiscoverWorker.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

protocol DiscoverWorkerProtocol {
    typealias SearchCompletion = (Result<[BookEntity], Error>) -> Void
    
    func searchBook(by prompt: String?, completion: @escaping SearchCompletion)
}

struct DiscoverWorker {
    let libraryTask: BookSearchTaskProtocol
    
    init(libraryTask: BookSearchTaskProtocol) {
        self.libraryTask = libraryTask
    }
}

extension DiscoverWorker: DiscoverWorkerProtocol {
    func searchBook(by prompt: String?,
                    completion: @escaping SearchCompletion) {
        libraryTask.fetchBooks(by: prompt, completion: completion)
    }
}


