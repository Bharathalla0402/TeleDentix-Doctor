//
//  EducationDetailViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 30/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class EducationDetailViewController: UIViewController
{
    
    @IBOutlet var ShareByLab: UILabel!
    @IBOutlet var UserView: UIView!
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserQualification: UILabel!
    @IBOutlet var UserDes: UILabel!
    @IBOutlet var ShareByConstant: NSLayoutConstraint!
    @IBOutlet var UserViewHeightConstant: NSLayoutConstraint!
    
    var strCheck = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if strCheck == "1"
        {
            ShareByConstant.constant = 0
            UserViewHeightConstant.constant = 0
            ShareByLab.isHidden = true
            UserView.isHidden = true
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
