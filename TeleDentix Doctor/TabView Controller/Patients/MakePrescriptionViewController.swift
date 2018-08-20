//
//  MakePrescriptionViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 29/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class MakePrescriptionViewController: UIViewController {
    
    @IBOutlet weak var PrescriptionName: ACFloatingTextfield!
    @IBOutlet weak var txtDrug: ACFloatingTextfield!
    @IBOutlet weak var txtType: ACFloatingTextfield!
    @IBOutlet weak var txtUnit: ACFloatingTextfield!
    @IBOutlet weak var txtFrequency: ACFloatingTextfield!
    @IBOutlet weak var txtIntake: ACFloatingTextfield!
    @IBOutlet weak var txtDuration: ACFloatingTextfield!
    
    @IBOutlet weak var DrugButt: UIButton!
    @IBOutlet weak var TypeButt: UIButton!
    @IBOutlet weak var FrequencyButt: UIButton!
    @IBOutlet weak var IntakeButt: UIButton!
    @IBOutlet weak var DurationButt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PrescriptionName.text = ""
        txtDrug.text = ""
        txtType.text = ""
        txtUnit.text = ""
        txtFrequency.text = ""
        txtIntake.text = ""
        txtDuration.text = ""
        
        
       
        // Do any additional setup after loading the view.
    }
    
   
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Drug Butt Clicked
    @IBAction func DrugButtClicked(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "Select Drug", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Drug 1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtDrug.text = "Drug 1"
        }
        
        let okAction1 = UIAlertAction(title: "Drug 2", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtDrug.text = "Drug 2"
        }
        
        let okAction2 = UIAlertAction(title: "Drug 3", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtDrug.text = "Drug 3"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(okAction1)
        alertController.addAction(okAction2)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK:  Type Butt Clicked
    @IBAction func TypeButtClicked(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "Select Type", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Type 1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtType.text = "Type 1"
        }
        
        let okAction1 = UIAlertAction(title: "Type 2", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtType.text = "Type 2"
        }
        
        let okAction2 = UIAlertAction(title: "Type 3", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtType.text = "Type 3"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(okAction1)
        alertController.addAction(okAction2)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK:  Frequency Butt Clicked
    @IBAction func FrequencyButtClicked(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "Select Frequency", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "1-0-0", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "1-0-0"
        }
        
        let okAction1 = UIAlertAction(title: "1-1-0", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "1-1-0"
        }
        
        let okAction2 = UIAlertAction(title: "1-1-1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "1-1-1"
        }
        
        let okAction3 = UIAlertAction(title: "0-1-1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "0-1-1"
        }
        
        let okAction4 = UIAlertAction(title: "0-0-1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "1-0-1"
        }
        
        let okAction5 = UIAlertAction(title: "1-0-1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "1-1-0"
        }
        
        let okAction6 = UIAlertAction(title: "0-1-0", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "0-1-1"
        }
        
        let okAction7 = UIAlertAction(title: "0-0-1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtFrequency.text = "0-0-1"
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(okAction1)
        alertController.addAction(okAction2)
        alertController.addAction(okAction3)
        alertController.addAction(okAction4)
        alertController.addAction(okAction5)
        alertController.addAction(okAction6)
        alertController.addAction(okAction7)
        
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK:  Intake Butt Clicked
    @IBAction func IntakeButtClicked(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "Select Intake", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Before Food", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtIntake.text = "Before Food"
        }
        
        let okAction1 = UIAlertAction(title: "After Food", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtIntake.text = "After Food"
        }
        
        let okAction2 = UIAlertAction(title: "Early Morning", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtIntake.text = "Early Morning"
        }
        
        let okAction3 = UIAlertAction(title: "Before Bed", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtIntake.text = "txtIntake"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(okAction1)
        alertController.addAction(okAction2)
        alertController.addAction(okAction3)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK:  Duration Butt Clicked
    @IBAction func DurationButtClicked(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "Select Days", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "5", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtDuration.text = "5 Days"
        }
        
        let okAction1 = UIAlertAction(title: "10", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtDuration.text = "10 Days"
        }
        
        let okAction2 = UIAlertAction(title: "20", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtDuration.text = "20 Days"
        }
        
        let okAction3 = UIAlertAction(title: "30", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtDuration.text = "30 days"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(okAction1)
        alertController.addAction(okAction2)
        alertController.addAction(okAction3)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK:  Submit Butt Clicked
    @IBAction func SubmitButtClicked(_ sender: UIButton)
    {
        var message = String()
        
        if (PrescriptionName.text?.isEmpty)!
        {
            message = "Please Enter Prescription Name"
        }
        else if (txtDrug.text?.isEmpty)!
        {
            message = "Please Select Drug"
        }
        else if (txtType.text?.isEmpty)!
        {
            message = "Please Select Type"
        }
        else if (txtUnit.text?.isEmpty)!
        {
            message = "Please Enter Unit(mg/ml)"
        }
        else if (txtFrequency.text?.isEmpty)!
        {
            message = "Please Select Frequency"
        }
        else if (txtIntake.text?.isEmpty)!
        {
            message = "Please Select Intake"
        }
        else if (txtDuration.text?.isEmpty)!
        {
            message = "Please Select Duration"
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
