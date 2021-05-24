//
//  EditDataTableViewController.swift
//  registrationApp
//
//  Created by harsh yadav on 21/05/21.
//
import UIKit
import CoreData
import Foundation

class EditDataTableViewController: UITableViewController {
    
    var indexRow = Int()
    
    @IBOutlet weak var newTableView: UITableView!
    
    @IBOutlet weak var lblcourseoff: UILabel!
    @IBOutlet weak var lbluniv: UILabel!
    @IBOutlet weak var lbllocat: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblStudent: UILabel!
    
    var getDataForEdit : College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.leftBarButtonItem = nil
        //self.navigationItem.hidesBackButton = true
        lbluniv.text = getDataForEdit?.university
        lblname.text = getDataForEdit?.collegeName
        lbllocat.text = getDataForEdit?.location
        lblcourseoff.text = getDataForEdit?.courseOffered
        
//        if students = college?.students?.allObjects as? [Student] {
//            lblStudent.text = students.count
//        }else{
//            lblStudent.text = "0"
//        }
//
    
       
    }
    
    @IBAction func editData(_ sender: UIBarButtonItem) {
        let formVc = self.storyboard?.instantiateViewController(identifier: "CollegeFormDataViewController") as! CollegeFormDataViewController
        formVc.isupdate = true
        formVc.getDataBack = getDataForEdit
        formVc.indexRow = indexRow
        self.navigationController?.pushViewController(formVc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let studentVc = storyboard.instantiateViewController(identifier: "StudentListViewController") as! StudentListViewController
            studentVc.college = getDataForEdit   //for passing the data in student list 
            
            navigationController?.pushViewController(studentVc, animated: true)
        }
    }
}
