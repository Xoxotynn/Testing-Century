import Foundation
import CoreData

class MockPersistentContainer: NSPersistentContainer {
    
    // MARK: Init
    init() {
        super.init(
            name: "CenturyDatabase",
            managedObjectModel: NSManagedObjectModel
                .mergedModel(from: [Bundle(for: type(of: self))])!)
        
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        persistentStoreDescriptions = [description]
        
        loadPersistentStores { _, error in
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
    }
}
