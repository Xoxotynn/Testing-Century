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
        let year = "2001"
        let century = Century(year: year, century: "21st")
        
        centuryService.addCentury(century)
        centuryService.addCentury(century)
        
        XCTAssertEqual(
            1,
            centuryService.countCenturies(withYear: year),
            "Duplicated centuries added to core data")
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
