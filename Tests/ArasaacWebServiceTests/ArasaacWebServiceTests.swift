import XCTest
@testable import ArasaacWebService

final class ArasaacWebServiceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ArasaacWebService().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
