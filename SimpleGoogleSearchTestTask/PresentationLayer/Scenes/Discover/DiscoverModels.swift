//
//  DiscoverModels.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

enum DiscoverModels {
    enum InitData {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum SearchPrompt {
        struct Request {
            let searchPrompt: String
        }
        
        struct Response {
            let books: [BookEntity]
        }
        
        struct ViewModel {
            let books: [BookEntity]
        }
    }
    
    enum Error {
        struct Request {
            let error: LocalizedError
        }
        
        struct Response {
            let error: LocalizedError
        }
        
        struct ViewModel {
            let error: LocalizedError
        }
    }
}
