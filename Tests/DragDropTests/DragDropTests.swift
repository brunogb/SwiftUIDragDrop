import XCTest
@testable import DragDrop

final class DragDropTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DragDrop().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
