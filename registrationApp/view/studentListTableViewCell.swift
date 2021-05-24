//
//  studentListTableViewCell.swift
//  registrationApp
//
//  Created by harsh yadav on 22/05/21.
//

import UIKit
import CoreData
class studentListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblContactNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
