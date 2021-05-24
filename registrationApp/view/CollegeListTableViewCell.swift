//
//  CollegeListTableViewCell.swift
//  registrationApp
//
//  Created by harsh yadav on 06/05/21.
//

import UIKit

class CollegeListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
   
    @IBOutlet weak var lblUnviversity: UILabel!
    @IBOutlet weak var lblCourseOffered: UILabel!
    
    
    var datacollege : College?{
        
        didSet{
            lblCollegeName.text = datacollege?.collegeName
            lblUnviversity.text = datacollege?.university
            lblLocation.text = datacollege?.location
            lblCourseOffered.text = datacollege?.courseOffered
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
