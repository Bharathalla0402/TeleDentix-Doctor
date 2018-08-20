//
//  ProfileInfoDetailViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 05/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ProfileInfoDetailViewController: UIViewController {
    @IBOutlet weak var txtFullName: ACFloatingTextfield!
    @IBOutlet weak var txtEmail: ACFloatingTextfield!
    @IBOutlet weak var txtPhone: ACFloatingTextfield!
    @IBOutlet weak var txtAddress: ACFloatingTextfield!
    @IBOutlet weak var txtGender: ACFloatingTextfield!
    @IBOutlet weak var txtDob: ACFloatingTextfield!
    @IBOutlet weak var txtZone: ACFloatingTextfield!
    @IBOutlet weak var txtCountry: ACFloatingTextfield!
    @IBOutlet weak var txtState: ACFloatingTextfield!
    @IBOutlet weak var txtCity: ACFloatingTextfield!
    
    @IBOutlet weak var SubmitButt: UIButton!
    
    var dropDownView = UIView()
    var popUpView = UIView()
    var datePicker = UIDatePicker()
    var Strdate = String()
    var dateString = String()
    var dateString2 = String()
    var cancelButton = UIButton()
    var doneButton = UIButton()
    let selectDateLbl = UILabel()
    let curntDate = NSDate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let currentDate: NSDate = NSDate()
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = "dd"
        Strdate = dateFormatter3.string(from: currentDate as Date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        dateString = dateFormatter.string(from: currentDate as Date)
        
        txtFullName.text = ""
        txtEmail.text = ""
        txtPhone.text = ""
        txtAddress.text = ""
        txtGender.text = ""
        txtDob.text = ""
        txtZone.text = ""
        txtCountry.text = ""
        txtState.text = ""
        txtCity.text = ""
        
        
    }
    
    
    
    // MARK:  Back Butt Clicked
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
    
    // MARK:  Dob Butt Clicked
    @IBAction func DobButtClicked(_ sender: UIButton)
    {
        self.view.endEditing(true)
        
        dropDownView.frame = CGRect(x:0 , y:0 , width: self.view.frame.size.width, height:self.view.frame.size.height)
        dropDownView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).withAlphaComponent(0.5)
        self.view.addSubview(dropDownView)
        
        popUpView.frame = CGRect(x: self.view.frame.size.width/2-130, y: self.view.frame.size.height/2-185, width:260, height: 300)
        popUpView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        popUpView.layer.cornerRadius = 5
        dropDownView.addSubview(popUpView)
        
        
        selectDateLbl.frame = CGRect(x: 0, y: 0, width:popUpView.frame.size.width, height: 40)
        selectDateLbl.text = "Select Date"
        selectDateLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        selectDateLbl.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        selectDateLbl.backgroundColor = #colorLiteral(red: 0.6619994044, green: 0.1256897449, blue: 0.2086914182, alpha: 1)
        selectDateLbl.textAlignment = .center
        popUpView.addSubview(selectDateLbl)
        
        
        datePicker.frame = CGRect(x: 0, y: 40, width:popUpView.frame.size.width, height: 220)
        datePicker.backgroundColor = #colorLiteral(red: 0.9386914372, green: 0.7797241807, blue: 0.6501298547, alpha: 1)
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(self.datePickerChanged(_:)), for: UIControlEvents.valueChanged)
        popUpView.addSubview(datePicker)
        
        
        cancelButton.frame = CGRect(x:0, y:datePicker.frame.origin.y+datePicker.frame.size.height, width:popUpView.frame.size.width/2-1, height:40)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.titleLabel!.font =  UIFont(name:"Helvetica-Bold", size: 17)
        cancelButton.backgroundColor=#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cancelButton.setTitleColor(#colorLiteral(red: 0.6619994044, green: 0.1256897449, blue: 0.2086914182, alpha: 1), for: .normal)
        cancelButton.addTarget(self, action: #selector(self.cancelButtonAction(_:)), for: UIControlEvents.touchUpInside)
        //cancelButton.layer.cornerRadius = 5
        popUpView.addSubview(cancelButton)
        
        doneButton.frame = CGRect(x:popUpView.frame.size.width/2, y:cancelButton.frame.origin.y, width:cancelButton.frame.size.width+1, height:40)
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel!.font = UIFont(name:"Helvetica-Bold",size: 17)
        doneButton.backgroundColor=#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doneButton.setTitleColor(#colorLiteral(red: 0.6619994044, green: 0.1256897449, blue: 0.2086914182, alpha: 1), for: .normal)
        doneButton.addTarget(self, action: #selector(self.doneButtonAction(_:)), for: UIControlEvents.touchUpInside)
        popUpView.addSubview(doneButton)
        
    }
    
    @objc func datePickerChanged(_ datePicker:UIDatePicker!)
    {
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = "dd"
        Strdate = dateFormatter3.string(from: datePicker.date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        dateString = dateFormatter.string(from: datePicker.date)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        dateString2 = dateFormatter2.string(from: datePicker.date)
    }
    
    @objc func cancelButtonAction(_ sender: UIButton!)
    {
        dropDownView.removeFromSuperview()
    }
    
    @objc func doneButtonAction(_ sender: UIButton!)
    {
        var Strtxt = String()
        if Strdate == "01" || Strdate == "1"
        {
            Strtxt = "st"
        }
        else if Strdate == "02" || Strdate == "2"
        {
            Strtxt = "nd"
        }
        else if Strdate == "03" || Strdate == "3"
        {
            Strtxt = "rd"
        }
        else
        {
            Strtxt = "th"
        }
        
        let strdate = Strdate+Strtxt+" "+dateString
        txtDob.text = strdate
        dropDownView.removeFromSuperview()
    }
    
    // MARK:  Submit Butt Clicked
    @IBAction func SubmitButtClicked(_ sender: UIButton)
    {
        var message = String()
        
        if (txtFullName.text?.isEmpty)!
        {
            message = "Please Enter Full Name"
        }
        else if (txtEmail.text?.isEmpty)!
        {
            message = "Please Enter Your Email Id"
        }
        else if !AFWrapperClass.isValidEmail(txtEmail.text!)
        {
            message = "Please enter valid Email"
        }
        else if (txtPhone.text?.isEmpty)!
        {
            message = "Please Enter Phone Number"
        }
        else if (txtDob.text?.isEmpty)!
        {
            message = "Please Select Your Date of birth"
        }
        else if (txtGender.text?.isEmpty)!
        {
            message = "Please Select Gender"
        }
        else if (txtZone.text?.isEmpty)!
        {
            message = "Please Select Zone"
        }
        else if (txtCountry.text?.isEmpty)!
        {
            message = "Please Select Country"
        }
        else if (txtState.text?.isEmpty)!
        {
            message = "Please Select State"
        }
        else if (txtCity.text?.isEmpty)!
        {
            message = "Please Select City"
        }
        else if (txtAddress.text?.isEmpty)!
        {
            message = "Please Enter Address"
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
    
    // MARK:  Zone Butt Clicked
    @IBAction func ZoneButtClicked(_ sender: UIButton)
    {
        
    }
    
     // MARK:  Country Butt Clicked
    @IBAction func CountryButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  State Butt Clicked
    @IBAction func StateButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  City Butt Clicked
    @IBAction func CityButtClicked(_ sender: UIButton)
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
