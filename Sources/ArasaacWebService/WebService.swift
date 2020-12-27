import Combine

public protocol WebService {
    func load<Model: Decodable>(_ type: Model.Type, from _endpoint: Endpoint) -> AnyPublisher<Model, Error>
}
