import XCTest
@testable import TestingCentury

class GetCenturyTests: XCTestCase {
    
    private var testedValue: String? = nil
    private var expectedResult: Int? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override open class var defaultTestSuite: XCTestSuite {
        let testSuite = XCTestSuite(name: NSStringFromClass(self))
        // Positive number input tests
        addTests(with: "501", expected: 6, to: testSuite)
        addTests(with: "547", expected: 6, to: testSuite)
        addTests(with: "600", expected: 6, to: testSuite)
        addTests(with: "4301", expected: 44, to: testSuite)
        addTests(with: "4387", expected: 44, to: testSuite)
        addTests(with: "4400", expected: 44, to: testSuite)
        
        // Negative(BC) number input tests
        addTests(with: "-150", expected: -2, to: testSuite)
        addTests(with: "-1130", expected: -12, to: testSuite)
        
        // Big int tests
        addTests(with: "100100", expected: 1001, to: testSuite)
        addTests(with: "100101", expected: 1002, to: testSuite)
        addTests(with: "2100500", expected: 21005, to: testSuite)
        addTests(with: "2100560", expected: 21006, to: testSuite)
        addTests(with: "310200100", expected: 3102001, to: testSuite)
        addTests(with: "310200140", expected: 3102002, to: testSuite)
        
        // Big negative int tests
        addTests(with: "-100100", expected: -1001, to: testSuite)
        addTests(with: "-100101", expected: -1002, to: testSuite)
        addTests(with: "-2100500", expected: -21005, to: testSuite)
        addTests(with: "-2100560", expected: -21006, to: testSuite)
        addTests(with: "-310200100", expected: -3102001, to: testSuite)
        addTests(with: "-310200140", expected: -3102002, to: testSuite)
        
        // Int max tests
        addTests(with: String(describing: Int.max), expected: 92233720368547759, to: testSuite)
        addTests(with: String(describing: Int.min), expected: -92233720368547759, to: testSuite)
        
        // Int overflow tests
        addTests(with: "9223372036854775809", expected: nil, to: testSuite)
        addTests(with: "-9223372036854775810", expected: nil, to: testSuite)
        
        // Invalid input tests
        addTests(with: "0", expected: nil, to: testSuite)
        addTests(with: "1f5", expected: nil, to: testSuite)
        return testSuite
    }
    
    func testCentury() throws {
        let vc = ViewController()
        
        let century = vc.getCentury(ofYear: testedValue ?? "")
        XCTAssertEqual(expectedResult, century)
    }
    
    private class func addTests(with value: String,
                                expected result: Int?,
                                to testSuite: XCTestSuite) {
        testInvocations.forEach { invocation in
            let testCase = GetCenturyTests(invocation: invocation)
            testCase.testedValue = value
            testCase.expectedResult = result
            testSuite.addTest(testCase)
        }
    }
}
