//
//  PictogramServiceResponse.swift
//  
//
//  Created by Alexandre Freire on 27/12/2020.
//

import Foundation

public struct PictogramServiceResponse: Decodable {
    let id: Int
    let keywords: [Keyword]
    let schematic: Bool
    let sex: Bool
    let violence: Bool
    let created: String
    let lastUpdated: String
    let downloads: Int
    let categories: [String]
    let synsets: [String]
    let tags: [String]
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case description = "desc"
        case keywords, schematic, sex, violence, created, lastUpdated, downloads,
            categories, synsets, tags
    }
}

public struct Keyword: Decodable {
    let idKeyword: Int?
    let keyword: String
    let plural: String?
    let idLocution: String?
    let meaning: String?
    let type: KeywordType
    let lse: Int?

    enum KeywordType: Int, Decodable {
        case person = 1
        case name
        case verb
        case description
        case social
        case miscellany
    }
}
