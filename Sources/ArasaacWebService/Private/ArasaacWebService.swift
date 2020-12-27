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
    private let baseURL = URL(string: "https://api.arasaac.org/api")!

    public init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }


    public func load<Model: Decodable>(_ type: Model.Type, from endpoint: Endpoint) -> AnyPublisher<Model, Error> {
        let request = endpoint.request(with: baseURL, adding: endpoint.parameters)
        let decoder = self.decoder

        return urlSession.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    fatalError("Unsupported protocol")
                }

                if 200 ..< 300 ~= httpResponse.statusCode {
                    return data
                } else {
                    throw ArasaacWebServiceError.badStatus(
                        code: httpResponse.statusCode,
                        payload: data
                    )
                }
            }
            .decode(type: type, decoder: decoder)
            .eraseToAnyPublisher()

    }
}
