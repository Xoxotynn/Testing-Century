import Foundation

class CenturyService {
    
    private let localDataSource: CoreDataService
    
    init(localDataSource: CoreDataService) {
        self.localDataSource = localDataSource
    }
    
    // MARK: - Public methods
    func getCentury(withYear year: String) -> Century? {
        return localDataSource.getCentury(withYear: year)
    }
    
    func addCentury(_ century: Century) {
        localDataSource.addCentury(century)
    }
    
    func deleteCentury(_ century: Century) {
        localDataSource.deleteCentury(century)
    }
    
    func countCenturies(withYear year: String) -> Int {
        return localDataSource.countCenturies(withYear: year)
    }
}
