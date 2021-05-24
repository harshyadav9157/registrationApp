//
//  CollegeListViewController.swift
//  registrationApp
//
//  Created by harsh yadav on 06/05/21.
//

import UIKit
import CoreData

class CollegeListViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var college = [College]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.college = DataBaseHelper.shareInstance.getCollegeData()
        self.tableView.reloadData()
    }
    
// MARK: -  Add College Data
    
    @IBAction func addCollegeButton(_ sender: UIBarButtonItem) {
        let collegeListVc = self.storyboard?.instantiateViewController(identifier: "CollegeFormDataViewController") as! CollegeFormDataViewController
        self.navigationController?.pushViewController(collegeListVc, animated: true)
    }
    
   // MARK: - represent your data on table .
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return college.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CollegeListTableViewCell
        Cell.datacollege = college[indexPath.row]
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
   }
    
    
    // MARK: - Edit cell , like delete from core data and table view cell.
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            college = DataBaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    // MARK: - Tranfer data from list View to edit View.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editVcData = self.storyboard?.instantiateViewController(identifier: "EditDataTableViewController") as! EditDataTableViewController
        editVcData.getDataForEdit = college[indexPath.row]
        editVcData.indexRow = indexPath.row    // trnafer the Data row wise.
        self.navigationController?.pushViewController(editVcData, animated: true)
    }
   
    
    // MARk
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, 100, 50, 10)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 3.0){
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
