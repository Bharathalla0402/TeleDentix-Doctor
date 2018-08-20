//
//  ChooseSelCell.swift
//  TeleDentix Doctor
//
//  Created by think360 on 25/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ChooseSelCell: UITableViewCell {

    @IBOutlet var ChooseName: UILabel!
    @IBOutlet var ClickView: UIView!
    @IBOutlet var ChooseButt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
