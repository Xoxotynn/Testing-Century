import XCTest
@testable import TestingCentury
import CoreData

class CoreDataServiceIntegrationTests: XCTestCase {
    
    var mockPersistentContainer: MockPersistentContainer!
    var coreDataService: CoreDataService!
    var centuryService: CenturyService!
    
    override func setUp() {
        super.setUp()
        mockPersistentContainer = MockPersistentContainer()
        coreDataService = CoreDataService.shared(
            context: mockPersistentContainer.viewContext)
        centuryService = CenturyService(localDataSource: coreDataService)
    }

    override func tearDown() {
        super.tearDown()
        centuryService = nil
    }
    
    func testAddCentury() throws {
        let year = "2001"
        let century = Century(year: year, century: "21st")
        
        centuryService.addCentury(century)
        
        XCTAssertEqual(
            century,
            centuryService.getCentury(withYear: year),
            "Failed to save century to core data")
    }
    
    func testAddDuplicateCentury() throws {
        let century = Century(year: "2001", century: "21st")
        
        centuryService.addCentury(century)
        centuryService.addCentury(century)
        
        XCTAssertEqual(
            1,
            centuryService.getAllCenturies().count,
            "Duplicated centuries added to core data")
    }
    
    func testGetAllCenturies() throws {
        let century1 = Century(year: "2001", century: "21st")
        let century2 = Century(year: "112", century: "12th")
        let century3 = Century(year: "1456", century: "15th")
        
        centuryService.addCentury(century1)
        centuryService.addCentury(century2)
        centuryService.addCentury(century3)
        
        let centuries = centuryService.getAllCenturies()
        XCTAssertEqual(3, centuries.count, "Number of centuries is wrong")
        XCTAssertTrue(centuries.contains(century1),
                      "Failed to get 21st century from getAll method result")
        XCTAssertTrue(centuries.contains(century2),
                      "Failed to get 12th century from getAll method result")
        XCTAssertTrue(centuries.contains(century3),
                      "Failed to get 15th century from getAll method result")
    }
    
    func testGetCentury() throws {
        let year = "2001"
        let century = Century(year: year, century: "21st")
        
        centuryService.addCentury(century)
        
        XCTAssertEqual(
            century,
            centuryService.getCentury(withYear: year),
            "Failed to get century from core data")
    }
    
    func testDeleteCentury() throws {
        let year = "2001"
        let century = Century(year: year, century: "21st")
        
        centuryService.addCentury(century)
        XCTAssertEqual(
            century,
            centuryService.getCentury(withYear: year),
            "Failed to get century from core data")
        
        centuryService.deleteCentury(century)
        XCTAssertNil(centuryService.getCentury(withYear: year),
                     "Failed to delete century from core data")
    }
}
