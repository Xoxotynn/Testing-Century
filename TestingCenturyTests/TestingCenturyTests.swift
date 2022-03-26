import XCTest
@testable import TestingCentury

class TestingCenturyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("2000")
        XCTAssertEqual("20th",
                       century,
                       "Wrong output with '2000' year input")
    }
}
