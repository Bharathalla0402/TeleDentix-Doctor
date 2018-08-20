//
//  AddPatientViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 27/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class AddPatientViewController: UIViewController {
    
    @IBOutlet weak var txtPatientName: ACFloatingTextfield!
    @IBOutlet weak var txtPhoneNumber: ACFloatingTextfield!
    @IBOutlet weak var txtEmail: ACFloatingTextfield!
    @IBOutlet weak var txtAge: ACFloatingTextfield!
    @IBOutlet weak var txtGender: ACFloatingTextfield!
    @IBOutlet weak var txtAppointMentDetails: ACFloatingTextfield!
    
    @IBOutlet weak var SubmitButt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPatientName.text = ""
        txtPhoneNumber.text = ""
        txtEmail.text = ""
        txtAge.text = ""
        txtGender.text = ""
        txtAppointMentDetails.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Gender Butt Clicked
    @IBAction func GenderButtClicked(_ sender: UIButton)
    {
        let optionMenu = UIAlertController(title: nil, message: "Select Gender", preferredStyle: .actionSheet)
        
        let pibraryAction = UIAlertAction(title: "Male", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            
            self.txtGender.text = "Male"
            
        })
        let cameraction = UIAlertAction(title: "FeMale", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            
            self.txtGender.text = "FeMale"
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(pibraryAction)
        optionMenu.addAction(cameraction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            let popOverPresentationController : UIPopoverPresentationController = optionMenu.popoverPresentationController!
            popOverPresentationController.sourceView                = SubmitButt
            popOverPresentationController.sourceRect                = SubmitButt.bounds
            popOverPresentationController.permittedArrowDirections  = UIPopoverArrowDirection.any
        }
    }
    
    
    // MARK:  AddNew Butt Clicked
    @IBAction func AddNewPatientButtClicked(_ sender: UIButton)
    {
        var message = String()
        
        if (txtPatientName.text?.isEmpty)!
        {
            message = "Please Enter Patient Name"
        }
        else if (txtPhoneNumber.text?.isEmpty)!
        {
            message = "Please Enter Phone Number"
        }
        else if (txtEmail.text?.isEmpty)!
        {
            message = "Please Enter Your Email Id"
        }
        else if !AFWrapperClass.isValidEmail(txtEmail.text!)
        {
            message = "Please enter valid Email"
        }
        else if (txtAge.text?.isEmpty)!
        {
            message = "Please Enter Age of Patient"
        }
        else if (txtGender.text?.isEmpty)!
        {
            message = "Please Select Gender"
        }
        else if (txtAppointMentDetails.text?.isEmpty)!
        {
            message = "Please Enter Appointment Details"
        }
        
        if message.count > 1
        {
            AFWrapperClass.alert(Constants.applicationName, message: message, view: self)
        }
        else
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as? TabbarController
            myVC?.selectedIndex = 1
            self.navigationController?.pushViewController(myVC!, animated: true)
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
