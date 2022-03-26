import XCTest
@testable import TestingCentury

class GetCenturyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Century detection tests
    func testCenturyDetection0Year() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "0")
        XCTAssertNil(century, "Wrong century with input '0'")
    }
    
    func testOneDigitCenturyDetectionFirstYear() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "501")
        XCTAssertEqual(6,
                       century,
                       "Wrong century with input '501'")
    }
    
    func testOneDigitCenturyDetectionRandomYear() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "547")
        XCTAssertEqual(6,
                       century,
                       "Wrong century with input '547'")
    }
    
    func testOneDigitCenturyDetectionLastYear() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "600")
        XCTAssertEqual(6,
                       century,
                       "Wrong century with input '600'")
    }
    
    func testTwoDigitCenturyDetectionFirstYear() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "4301")
        XCTAssertEqual(44,
                       century,
                       "Wrong century with input '4301'")
    }
    
    func testTwoDigitCenturyDetectionRandomYear() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "4387")
        XCTAssertEqual(44,
                       century,
                       "Wrong century with input '4387'")
    }
    
    func testTwoDigitCenturyDetectionLastYear() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "4400")
        XCTAssertEqual(44,
                       century,
                       "Wrong century with input '4400'")
    }
    
    // MARK: Negative century detection
    func testOneDigitNegativeCentury() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "-150")
        XCTAssertEqual(-2,
                       century,
                       "Wrong century with input '-150'")
    }
    
    func testTwoDigitNegativeCentury() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "-1130")
        XCTAssertEqual(-12,
                       century,
                       "Wrong century with input '-1130'")
    }
    
    // MARK: Not number tests
    func testNotNumberInput() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: "1f5")
        XCTAssertNil(century, "Wrong output with input '1f5'")
    }
}
