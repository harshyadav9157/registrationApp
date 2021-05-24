//
//  CollegeFormViewController.swift
//  registrationApp
//
//  Created by harsh yadav on 06/05/21.
//
import UIKit
import Foundation
import CoreData

class CollegeFormViewController: UIViewController {

    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    @IBOutlet weak var txtCourseOffered: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var getDataBack : College?
    var isupdate = false
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        txtCollegeName.text = getDataBack?.collegeName
        txtLocation.text = getDataBack?.location
        txtUniversity.text = getDataBack?.university
        txtCourseOffered.text = getDataBack?.courseOffered
        
        if isupdate{
            saveButton.setTitle("update", for: .normal)
        }else{
            saveButton.setTitle("Save", for: .normal)
        }
    }

    
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        let dict = ["collegeName" : txtCollegeName.text , "location" : txtLocation.text , "university" : txtUniversity.text , "courseOffered" : txtCourseOffered.text ]
        let collegeFormVc = self.storyboard?.instantiateViewController(identifier: "CollegeListViewController") as! EditDataTableViewController
        self.navigationController?.pushViewController(collegeFormVc, animated: true)
        
        if isupdate{
            DataBaseHelper.shareInstance.editCollegeData(collegeDict: dict as! [String:String], index: indexRow)
            isupdate = false
        }else{
            DataBaseHelper.shareInstance.saveCollegeData(collegeDict: dict as! [String:String])
        }
        
        
    }
    
}
    

