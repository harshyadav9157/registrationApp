//
//  StudentFormViewController.swift
//  registrationApp
//
//  Created by harsh yadav on 22/05/21.
//

import UIKit
import CoreData

class StudentFormViewController: UIViewController {
    
    var college : College?   // for passing the college data
    
    @IBOutlet weak var txtStudent: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Student Details"

   
    }
    

    @IBAction func saveStudentData(_ sender: UIButton) {
        
        
        guard let mainCollege = college  else { return }
        let dataDict = ["email" : txtEmail.text , "contactNumber" : txtNumber.text , "studentName" : txtStudent.text , ]
        DataBaseHelper.shareInstance.saveStudentData(studentDict: dataDict as! [String:String], college: mainCollege)
      
        
    }
    

}
