//
//  RequestCell.swift
//  TeleDentix Doctor
//
//  Created by think360 on 02/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class RequestCell: UITableViewCell {

    @IBOutlet var UserImg: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserQualify: UILabel!
    @IBOutlet var AcceptButt: UIButton!
    @IBOutlet var IgnoreButt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
