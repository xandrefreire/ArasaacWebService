//
//  File.swift
//  
//
//  Created by Alexandre Freire on 27/12/2020.
//

import Foundation

public enum ArasaacEndpoint {
    case searchPictogram(query: String)
    case imageURL(fromPictogramWithId: Int)
}

extension ArasaacEndpoint: Endpoint {

    public var baseURL: URL {
        URL(string: "https://api.arasaac.org/api")!
    }
    
    public var path: String {
        switch self {
        case .searchPictogram(let query):
            return "/pictograms/es/search/\(query)"

        case .imageURL(let id):
            return "/pictograms/\(id)"
        }
    }

    public var parameters: [String : String] {
        switch self {
        case .searchPictogram:
            return [:]

        case .imageURL:
            return [
                "url": "true",
                "download": "false"
            ]
        }
    }
}
