//
//  ForgotViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 20/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet var txtEmail: ACFloatingTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtEmail.text = ""
        
        
    }
    
    
     // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
      // MARK:  Submit Butt Clicked
    @IBAction func SubmitButtClicked(_ sender: UIButton)
    {
        var message = String()
    
        if (txtEmail.text?.isEmpty)!
        {
            message = "Please Enter Your Email Id"
        }
        else if !AFWrapperClass.isValidEmail(txtEmail.text!)
        {
            message = "Please enter valid Email"
        }
        
        if message.count > 1
        {
            AFWrapperClass.alert(Constants.applicationName, message: message, view: self)
        }
        else
        {
            self.navigationController?.popViewController(animated: true)
        }
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
