import XCTest
@testable import TestingCentury

class WhatCenturyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: 'st' ending tests
    func testOneDigitCenturyStEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("64")
        XCTAssertEqual("1st",
                       century,
                       "Wrong output with input '1'")
    }
    
    func testTwoDigitCenturyStEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("2050")
        XCTAssertEqual("21st",
                       century,
                       "Wrong output with input '2001'")
    }
    
    // MARK: 'nd' ending tests
    func testOneDigitCenturyNdEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("140")
        XCTAssertEqual("2nd",
                       century,
                       "Wrong output with input '140'")
    }
    
    func testTwoDigitCenturyNdEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("3130")
        XCTAssertEqual("32nd",
                       century,
                       "Wrong output with input '3130'")
    }
    
    // MARK: 'rd' ending tests
    func testOneDigitCenturyRdEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("280")
        XCTAssertEqual("3rd",
                       century,
                       "Wrong output with input '280'")
    }
    
    func testTwoDigitCenturyRdEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("4210")
        XCTAssertEqual("43rd",
                       century,
                       "Wrong output with input '4210'")
    }
    
    // MARK: 'th' ending tests
    func testOneDigitCenturyThEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("555")
        XCTAssertEqual("6th",
                       century,
                       "Wrong output with input '555'")
    }
    
    func testTwoDigitCenturyThEnding() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("5660")
        XCTAssertEqual("57th",
                       century,
                       "Wrong output with input '5660'")
    }
    
    // MARK: 'th' second ten tests
    func testThEnding11Century() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("1022")
        XCTAssertEqual("11th",
                       century,
                       "Wrong output with input '1022'")
    }
    
    func testThEnding12Century() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("1132")
        XCTAssertEqual("12th",
                       century,
                       "Wrong output with input '1022'")
    }
    
    func testThEnding13Century() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("1202")
        XCTAssertEqual("13th",
                       century,
                       "Wrong output with input '1022'")
    }
    
    // MARK: Invalid input tests
    func test0YearInput() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("0")
        XCTAssertEqual("",
                       century,
                       "Wrong output with input '0'")
    }
    
    func testNotNumberInput() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury("invalid")
        XCTAssertEqual("",
                       century,
                       "Wrong output with input 'invalid'")
    }
}
