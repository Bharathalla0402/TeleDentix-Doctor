//
//  ChangePasswordViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 08/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet var txtCurrentPassword: ACFloatingTextfield!
    @IBOutlet var txtNewPassword: ACFloatingTextfield!
    @IBOutlet var txtConfirmPassword: ACFloatingTextfield!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtCurrentPassword.text = ""
        txtNewPassword.text = ""
        txtConfirmPassword.text = ""

        // Do any additional setup after loading the view.
    }
    
     // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Submit Butt Clicked
    @IBAction func SubmitButtClicked(_ sender: Any)
    {
        
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
