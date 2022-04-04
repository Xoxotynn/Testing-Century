import Foundation
import CoreData

class CoreDataService {
    
    // MARK: - Properties
    let context: NSManagedObjectContext
    
    private static var shared = CoreDataService()
    
    // MARK: - Init
    private init() {
        let container = NSPersistentContainer(name: "CenturyDatabase")
        container.loadPersistentStores { _, error in
            if let error = error {
                print(String(describing: error))
            }
        }
        
        context = container.newBackgroundContext()
    }
    
    private init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    // MARK: - Public methods
    static func shared(context: NSManagedObjectContext? = nil)
    -> CoreDataService {
        guard let context = context else {
            shared = CoreDataService()
            return shared
        }
        
        shared = CoreDataService(context: context)
        return shared
    }
    
    func getAllCenturies() -> [Century] {
        CenturyCoreData
            .getAll(context: context)
            .compactMap { $0.toDomainModel() }
    }
    
    func getCentury(withYear year: String) -> Century? {
        CenturyCoreData
            .get(withYear: year, context: context)?
            .toDomainModel()
    }
    
    func addCentury(_ century: Century) {
        CenturyCoreData.add(century: century, context: context)
        saveContext()
    }
    
    func deleteCentury(_ century: Century) {
        CenturyCoreData.delete(century: century, context: context)
        saveContext()
    }
    
    // MARK: - Private Methods
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                fatalError(String(describing: error))
            }
        }
    }
}
