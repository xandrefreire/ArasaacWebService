//
//  PictogramServiceResponse.swift
//  
//
//  Created by Alexandre Freire on 27/12/2020.
//

import Foundation

public struct PictogramServiceResponse: Decodable {
    public let id: Int
    public let keywords: [Keyword]
    public let schematic: Bool
    public let sex: Bool
    public let violence: Bool
    public let created: String
    public let lastUpdated: String
    public let downloads: Int
    public let categories: [String]
    public let synsets: [String]
    public let tags: [String]
    public let description: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case description = "desc"
        case keywords, schematic, sex, violence, created, lastUpdated, downloads,
            categories, synsets, tags
    }
}

public struct Keyword: Decodable {
    public let idKeyword: Int?
    public let keyword: String
    public let plural: String?
    public let idLocution: String?
    public let meaning: String?
    public let type: KeywordType
    public let lse: Int?

    public enum KeywordType: Int, Decodable {
        case person = 1
        case name
        case verb
        case description
        case social
        case miscellany
    }
}
