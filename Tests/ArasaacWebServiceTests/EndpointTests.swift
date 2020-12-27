import XCTest
@testable import ArasaacWebService

final class EndpointTests: XCTestCase {

    let baseURL = URL(string: "https://api.arasaac.org/api")!

    func testEndpoint_requestIsCreatedCorrectly() {
        let searchEndpoint = ArasaacEndpoint.searchPictogram(query: "casa")
        let searchRequest = searchEndpoint.request(with: baseURL, adding: ["param": "value"])

        XCTAssertEqual(searchRequest.url?.absoluteString, "https://api.arasaac.org/api/pictograms/es/search/casa?param=value")
    }
}
