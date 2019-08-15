import XCTest
@testable import CombinePrintout

final class CombinePrintoutTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CombinePrintout().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
