//
//  Endpoint.swift
//
//  Created by Alexandre Freire on 27/12/2020.
//

import Foundation

public protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get}
    var parameters: [String: String] { get }
}

public enum HTTPMethod: String {
    case get = "GET"
}

extension Endpoint {
    public var method: HTTPMethod {
        return .get
    }
}

extension Endpoint {
    func request(with baseURL: URL, adding parameters: [String : String]) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)

        var newParameters = self.parameters
        parameters.forEach{ newParameters.updateValue($1, forKey: $0) }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)

        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue

        return request
    }
}
