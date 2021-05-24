//
//  College+CoreDataProperties.swift
//  registrationApp
//
//  Created by harsh yadav on 06/05/21.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var collegeName: String?
    @NSManaged public var location: String?
    @NSManaged public var courseOffered: String?
    @NSManaged public var university: String?
    @NSManaged public var students: NSSet?

}


// MARK: Generated accessors for students
extension College {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}
