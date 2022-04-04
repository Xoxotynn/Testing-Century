import Foundation
import CoreData

class CoreDataService {
    
    // MARK: - Properties
    private static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CenturyDatabase")
        container.loadPersistentStores { _, error in
            if let error = error {
                print(String(describing: error))
            }
        }
        return container
    }()
    
    private var context: NSManagedObjectContext {
        Self.container.viewContext
    }
    
    // MARK: - Public methods
    func getCentury(withYear year: String) -> Century {
        return Century(year: "", century: "")
    }
    
    func addCentury(_ century: Century) {
        
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
