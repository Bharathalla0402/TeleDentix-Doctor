//
//  NewPatientViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 01/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class NewPatientViewController: UIViewController
{

    @IBOutlet var txtPatientName: ACFloatingTextfield!
    @IBOutlet var txtPatientId: ACFloatingTextfield!
    @IBOutlet var txtPhoneNumber: ACFloatingTextfield!
    @IBOutlet var txtEmailId: ACFloatingTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPatientName.text = ""
        txtPatientId.text = ""
        txtPhoneNumber.text = ""
        txtEmailId.text = ""
        

        self.addDoneButtonOnKeyboard()
        // Do any additional setup after loading the view.
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.txtPatientName.inputAccessoryView = doneToolbar
        self.txtPatientId.inputAccessoryView = doneToolbar
        self.txtPhoneNumber.inputAccessoryView = doneToolbar
        self.txtEmailId.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.view.endEditing(true)
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Notification Butt Clicked
    @IBAction func NotificationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Previous Butt Clicked
    @IBAction func PreviousButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Next Butt Clicked
    @IBAction func NextButtClicked(_ sender: UIButton)
    {
        var message = String()
        
        if (txtPatientName.text?.isEmpty)!
        {
            message = "Please Enter Patient Name"
        }
        else if (txtPatientId.text?.isEmpty)!
        {
            message = "Please Enter Patient Id"
        }
        else if (txtPhoneNumber.text?.isEmpty)!
        {
            message = "Please Enter Phone Number"
        }
        else if (txtEmailId.text?.isEmpty)!
        {
            message = "Please Enter Your Email Id"
        }
        else if !AFWrapperClass.isValidEmail(txtEmailId.text!)
        {
            message = "Please enter valid Email"
        }
        
        if message.count > 1
        {
            AFWrapperClass.alert(Constants.applicationName, message: message, view: self)
        }
        else
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseDoctorViewController") as? ChooseDoctorViewController
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
