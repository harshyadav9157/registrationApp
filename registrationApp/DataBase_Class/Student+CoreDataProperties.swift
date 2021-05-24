//
//  Student+CoreDataProperties.swift
//  registrationApp
//
//  Created by harsh yadav on 23/05/21.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var contactNumber: String?
    @NSManaged public var email: String?
    @NSManaged public var studentName: String?
    @NSManaged public var universities: College?

}

extension Student : Identifiable {

}
