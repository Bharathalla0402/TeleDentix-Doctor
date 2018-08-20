//
//  GoOfflineViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 08/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class GoOfflineViewController: UIViewController {

    @IBOutlet var txtAllDayOffline: ACFloatingTextfield!
    @IBOutlet var txtFrom: ACFloatingTextfield!
    @IBOutlet var txtTo: ACFloatingTextfield!
    
    @IBOutlet var DateTimePicker: UIDatePicker!
    @IBOutlet var CalenderView: UIView!
    
    var Strcheck = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtAllDayOffline.text = ""
        txtFrom.text = ""
        txtTo.text = ""
        
        
        CalenderView.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  All Day Butt Clicked
    @IBAction func AllDayButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  From Butt Clicked
    @IBAction func FromButtClicked(_ sender: UIButton)
    {
        Strcheck = "1"
         CalenderView.isHidden = false
    }
    
    // MARK:  To Butt Clicked
    @IBAction func ToButtClicked(_ sender: UIButton)
    {
        Strcheck = "2"
        CalenderView.isHidden = false
    }
    
    // MARK:  Cancel Butt Clicked
    @IBAction func CancelButtClicked(_ sender: UIButton)
    {
         CalenderView.isHidden = true
    }
    
    // MARK:  Done Butt Clicked
    @IBAction func DoneButtClicked(_ sender: UIButton)
    {
        if Strcheck == "1"
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, hh:mm aa"
            var localTimeZoneName: String { return TimeZone.current.identifier }
            formatter.timeZone = NSTimeZone(name: localTimeZoneName) as TimeZone?
            self.txtFrom.text = formatter.string(from: DateTimePicker.date)
        }
        else
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, hh:mm aa"
            var localTimeZoneName: String { return TimeZone.current.identifier }
            formatter.timeZone = NSTimeZone(name: localTimeZoneName) as TimeZone?
            self.txtTo.text = formatter.string(from: DateTimePicker.date)
        }
         CalenderView.isHidden = true
    }
    
    // MARK:  Date Picker Clicked
    @IBAction func DatePickerChanged(_ sender: UIDatePicker)
    {
        
    }
    
    
     // MARK:  Submit Butt Clicked
    @IBAction func SubmitButtClicked(_ sender: UIButton)
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
