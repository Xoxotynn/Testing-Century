import Foundation
import CoreData


public class CenturyCoreData: NSManagedObject {
    
    // MARK: - Public methods
    static func getAll(context: NSManagedObjectContext) -> [CenturyCoreData] {
        let request = CenturyCoreData.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }
    
    static func get(withYear year: String,
                    context: NSManagedObjectContext) -> CenturyCoreData? {
        let request = CenturyCoreData.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", "year", year)
        return try? context.fetch(request).first
    }

    static func add(century: Century,
                    context: NSManagedObjectContext) {
        if let _ = get(withYear: century.year, context: context) {
            return
        }
        
        let centuryCoreData = CenturyCoreData(context: context)
        centuryCoreData.year = century.year
        centuryCoreData.century = century.century
    }

    static func delete(century: Century,
                       context: NSManagedObjectContext) {
        let request = CenturyCoreData.fetchRequest()
        request.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                NSPredicate(format: "%K == %@", "year", century.year),
                NSPredicate(format: "%K == %@", "century", century.century)
            ])
        guard let centuryCoreData = try? context.fetch(request).first else {
            return
        }

        context.delete(centuryCoreData)
    }

    func toDomainModel() -> Century {
        Century(year: year ?? "", century: century ?? "")
    }

}
