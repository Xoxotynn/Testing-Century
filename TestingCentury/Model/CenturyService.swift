import Foundation

class CenturyService {
    
    private let localDataSource: CoreDataService
    
    init(localDataSource: CoreDataService) {
        self.localDataSource = localDataSource
    }
    
    // MARK: - Public methods
    func getAllCenturies() -> [Century] {
        localDataSource.getAllCenturies()
    }
    
    func getCentury(withYear year: String) -> Century? {
        localDataSource.getCentury(withYear: year)
    }
    
    func addCentury(_ century: Century) {
        localDataSource.addCentury(century)
    }
    
    func deleteCentury(_ century: Century) {
        localDataSource.deleteCentury(century)
    }
}
