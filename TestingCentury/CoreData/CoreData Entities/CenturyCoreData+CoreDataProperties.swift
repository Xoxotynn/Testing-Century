import Foundation
import CoreData


extension CenturyCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CenturyCoreData> {
        return NSFetchRequest<CenturyCoreData>(entityName: "Century")
    }

    @NSManaged public var year: String?
    @NSManaged public var century: String?

}

extension CenturyCoreData : Identifiable {

}
