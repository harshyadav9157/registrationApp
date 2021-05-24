//
//  StudentListViewController.swift
//  registrationApp
//
//  Created by harsh yadav on 22/05/21.
//

import UIKit
import CoreData

class StudentListViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
        
    @IBOutlet weak var studentTableView: UITableView!
    
    var studentArr = [Student]()
    var college : College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if college?.students?.allObjects != nil{
            studentArr = college?.students?.allObjects as! [Student]
            self.studentTableView.reloadData()
        }
//        self.studentArr = DataBaseHelper.shareInstance.getStudentData()
//        self.studentTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.studentArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: "studentListTableViewCell", for: indexPath) as! studentListTableViewCell
        cell.lblEmail.text = studentArr[indexPath.row].email
        cell.lblContactNumber.text = studentArr[indexPath.row].contactNumber
        cell.lblStudentName.text = studentArr[indexPath.row].studentName
        return cell
    }
    
    
    @IBAction func addStudentData(_ sender: UIBarButtonItem) {
        
        let studentFormVc = self.storyboard?.instantiateViewController(identifier: "StudentFormViewController") as! StudentFormViewController
        studentFormVc.college = college  // for pass the particular college data in student form.
        self.navigationController?.pushViewController(studentFormVc, animated: true)
    
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            studentArr = DataBaseHelper.shareInstance.deleteStudentData(index: indexPath.row)
            self.studentTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
