//
//  ConnectedDocsCell.swift
//  TeleDentix Doctor
//
//  Created by think360 on 02/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ConnectedDocsCell: UITableViewCell {

    @IBOutlet var UserImg: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var CareName: UILabel!
    @IBOutlet var DoctorQualifycationLab: UILabel!
    @IBOutlet var MoreButt: UIButton!
    @IBOutlet var VideoButt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
