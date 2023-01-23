//
//  ResponseEntity.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

struct Response: Codable {
    var kind: String?
    var totalItems: Int?
    var items: [BookEntity]?
}
