import XCTest
@testable import TestingCentury

class WhatCenturyTests: XCTestCase {
    
    private var testedValue: String? = nil
    private var expectedResult: String? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override open class var defaultTestSuite: XCTestSuite {
        let testSuite = XCTestSuite(name: NSStringFromClass(self))
        // 'st' ending tests
        addTests(with: "64", expected: "1st", to: testSuite)
        addTests(with: "2050", expected: "21st", to: testSuite)
        
        // 'nd' ending tests
        addTests(with: "140", expected: "2nd", to: testSuite)
        addTests(with: "3130", expected: "32nd", to: testSuite)
        
        // 'rd' ending tests
        addTests(with: "280", expected: "3rd", to: testSuite)
        addTests(with: "4210", expected: "43rd", to: testSuite)
        
        // 'th' ending tests
        addTests(with: "555", expected: "6th", to: testSuite)
        addTests(with: "5660", expected: "57th", to: testSuite)
        
        // 'th' second ten ending tests
        addTests(with: "1022", expected: "11th", to: testSuite)
        addTests(with: "1132", expected: "12th", to: testSuite)
        addTests(with: "1210", expected: "13th", to: testSuite)
        
        // BC century tests
        addTests(with: "-555", expected: "6th BC", to: testSuite)
        addTests(with: "-5660", expected: "57th BC", to: testSuite)
        addTests(with: "-1022", expected: "11th BC", to: testSuite)
        addTests(with: "-1132", expected: "12th BC", to: testSuite)
        addTests(with: "-1210", expected: "13th BC", to: testSuite)
        
        // Invalid input tests
        addTests(with: "0", expected: "", to: testSuite)
        addTests(with: "invalid", expected: "", to: testSuite)
        return testSuite
    }
    
    func testCentury() throws {
        let vc = ViewController()
        
        let century = vc.whatCentury(testedValue ?? "")
        XCTAssertEqual(expectedResult, century)
    }
    
    private class func addTests(with value: String,
                                expected result: String,
                                to testSuite: XCTestSuite) {
        testInvocations.forEach { invocation in
            let testCase = WhatCenturyTests(invocation: invocation)
            testCase.testedValue = value
            testCase.expectedResult = result
            testSuite.addTest(testCase)
        }
    }
}
