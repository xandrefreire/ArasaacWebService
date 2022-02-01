import Combine

public protocol WebService {
    func load<Model: Decodable>(_ type: Model.Type, from endpoint: Endpoint) async throws-> Model
}
