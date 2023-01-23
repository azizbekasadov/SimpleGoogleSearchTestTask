//
//  BookEntity.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

struct BookEntity: Codable {
    var kind: String?
    var id: String?
    var etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfoEntity?
}
