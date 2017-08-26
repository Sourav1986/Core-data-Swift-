//
//  Employee+CoreDataProperties.swift
//  Core Data TODO
//
//  Created by Sourav Basu Roy on 31/05/17.
//  Copyright © 2017 Sourav Basu Roy. All rights reserved.
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var empid: String?
    @NSManaged public var address: String?
    @NSManaged public var role: String?
    @NSManaged public var salary: NSDecimalNumber?

}
