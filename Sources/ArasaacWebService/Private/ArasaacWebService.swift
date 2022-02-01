//
//  ArasaacWebService.swift
//
//  Created by Alexandre Freire on 27/12/2020.
//

import Foundation
import Combine

enum ArasaacWebServiceError: Error {
    case badStatus(code: Int, payload: Data)
    case api(code: Int, message: String)
}

final public class ArasaacWebService: WebService {
    private let urlSession: URLSession
    private let decoder = JSONDecoder()
    private let cache = NSCache<AnyObject, AnyObject>()

    public init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }

    public func load<Model: Decodable>(_ type: Model.Type, from endpoint: Endpoint) async throws -> Model {
        let request = endpoint.request(adding: [:])
        if let url = request.url,
           let data = cache.object(forKey: url as AnyObject) as? NSData {
            return try decoder.decode(type, from: Data(referencing: data))
        }

        let (data, response) = try await urlSession.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            fatalError("Unsupported protocol")
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw ArasaacWebServiceError.badStatus(
                code: httpResponse.statusCode,
                payload: data
            )
        }

        if let url = request.url {
            cache.setObject(data as AnyObject, forKey: url as AnyObject)
        }

        return try decoder.decode(type, from: data)
    }
}
