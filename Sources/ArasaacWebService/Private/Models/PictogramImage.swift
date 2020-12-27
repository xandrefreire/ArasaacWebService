//
//  File.swift
//  
//
//  Created by Alexandre Freire on 27/12/2020.
//

import Foundation

public struct PictogramImage: Decodable {
    public let url: URL

    enum CodingKeys: String, CodingKey {
        case url = "image"
    }
}
