//
//  CenturyCoreData+CoreDataProperties.swift
//  TestingCentury
//
//  Created by Эдуард Логинов on 04.04.2022.
//
//

import Foundation
import CoreData


extension CenturyCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CenturyCoreData> {
        return NSFetchRequest<CenturyCoreData>(entityName: "CenturyCoreData")
    }

    @NSManaged public var year: String?
    @NSManaged public var century: String?

}

extension CenturyCoreData : Identifiable {

}
