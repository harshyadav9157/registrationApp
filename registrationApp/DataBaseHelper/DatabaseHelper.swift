//
//  DatabaseHelper.swift
//  registrationApp
//
//  Created by harsh yadav on 06/05/21.
//


import Foundation
import UIKit
import CoreData

class DataBaseHelper {
    
    
    
    static let shareInstance = DataBaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    // MARK: - Save College Data
    
    func saveCollegeData(collegeDict :[String:String]){
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context!) as! College
        college.collegeName = collegeDict["collegeName"]
        college.location = collegeDict["location"]
        college.courseOffered = collegeDict["courseOffered"]
        college.university = collegeDict["university"]
        do{
            try context?.save()
        }catch{
            print("error in saving college data")}
    }
    
    // MARK: - Get College Data
    
    func getCollegeData()->[College]{
        var college = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        
        do{
            college = try context?.fetch(fetchRequest) as! [College]
        }catch{
            print("error")
        }
        return college.reversed()
    }
    
    // MARK: - Delete College Data
    
    func deleteCollegeData(index : Int)->[College]{
        var college = getCollegeData()
        context?.delete(college[index])
        college.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("cannot delete the data")
        }
        return college
    }
    
    // MARK: - Edit College Data
    
    func editCollegeData(collegeDict :[String:String] , index : Int) {
        let college = getCollegeData()
        college[index].collegeName = collegeDict["collegeName"]
        college[index].location = collegeDict["location"]
        college[index].courseOffered = collegeDict["courseOffered"]
        college[index].university = collegeDict["university"]
        do{
            try context?.save()
        }catch{
            print(error)
        }
    }
    
    // MARK: - Save Student Data
    
    func saveStudentData(studentDict :[String:String] , college : College){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.email = studentDict["email"]
        student.contactNumber = studentDict["contactNumber"]
        student.studentName = studentDict["studentName"]
        student.universities = college
       
        do{
            try context?.save()
        }catch{
            print("error in saving college data")}
    }
    
    // MARK: - Get Student Data
    
    func getStudentData()->[Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")

        do{
            student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("error")
        }
        return student.reversed()
    }
    
    // MARK: - Delete Student Data
    
    func deleteStudentData(index : Int)->[Student]{
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("cannot delete the data")
        }
        return student
    }
    
}

