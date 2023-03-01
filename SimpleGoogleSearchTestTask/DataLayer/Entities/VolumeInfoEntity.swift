//
//  VolumeInfoEntity.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

struct VolumeInfoEntity: Codable {
    var title: String?
    var subtitle: String?
    var authors: [String]?
    var publisher: PublisherEntity?
    var description: String?
    var industryIdentifiers: [IndustryIdentifiersEntity]?
    var pageCount: Int?
    var categories: [String]?
    var averageRating: Int?
    var ratingsCount: Int?
    var imageLinks: ImageLinksEntity?
    var previewLink: String?
}

struct PublisherEntity: Codable {
    var publisher: String?
    var publishedDate: String?
}
