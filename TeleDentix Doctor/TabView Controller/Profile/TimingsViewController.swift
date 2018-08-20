//
//  TimingsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 07/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class TimingsViewController: UIViewController {

    @IBOutlet var FeeSegment: UISegmentedControl!
    @IBOutlet var AllClinicLab: UILabel!
    @IBOutlet var ClinicButt: UIButton!
    
    @IBOutlet var MondayButt: UIButton!
    @IBOutlet var MondayAddButt: UIButton!
    @IBOutlet var MondayDownImage: UIImageView!
    @IBOutlet var MonDayView: UIView!
    @IBOutlet var MondayHeightConstant: NSLayoutConstraint!
    @IBOutlet var txtMondayFrom: ACFloatingTextfield!
    @IBOutlet var txtMondayTo: ACFloatingTextfield!
    
    
    @IBOutlet var TuesdayButt: UIButton!
    @IBOutlet var TuesdayAddButt: UIButton!
    @IBOutlet var TuesdayDownImag: UIImageView!
    @IBOutlet var TuesdayView: UIView!
    @IBOutlet var TuesdayHeightConstant: NSLayoutConstraint!
    @IBOutlet var txtTuesdayFrom: ACFloatingTextfield!
    @IBOutlet var txtTuesdayTo: ACFloatingTextfield!
    
    
    @IBOutlet var WednesdayButt: UIButton!
    @IBOutlet var WednesdayAddButt: UIButton!
    @IBOutlet var WednesdayImag: UIImageView!
    @IBOutlet var WednesdayView: UIView!
    @IBOutlet var WednesdayHeightConstant: NSLayoutConstraint!
    @IBOutlet var txtWednesdayFrom: ACFloatingTextfield!
    @IBOutlet var txtWednesdayTo: ACFloatingTextfield!
    
    
    @IBOutlet var ThursdayButt: UIButton!
    @IBOutlet var ThursdayAddButt: UIButton!
    @IBOutlet var ThursdayImg: UIImageView!
    @IBOutlet var ThursdayView: UIView!
    @IBOutlet var ThursdayHeightConstant: NSLayoutConstraint!
    @IBOutlet var txtThursdayFrom: ACFloatingTextfield!
    @IBOutlet var txtThursdayTo: ACFloatingTextfield!
    
    
    @IBOutlet var FridayButt: UIButton!
    @IBOutlet var FridayAddButt: UIButton!
    @IBOutlet var FridayImg: UIImageView!
    @IBOutlet var FridayView: UIView!
    @IBOutlet var FridayHeightConstant: NSLayoutConstraint!
    @IBOutlet var txtFridayFrom: ACFloatingTextfield!
    @IBOutlet var txtFridayTo: ACFloatingTextfield!
    
    
    @IBOutlet var SaturdayButt: UIButton!
    @IBOutlet var SaturdayAddButt: UIButton!
    @IBOutlet var SaturdayImg: UIImageView!
    @IBOutlet var SaturdayView: UIView!
    @IBOutlet var SaturdayHeightConstant: NSLayoutConstraint!
    @IBOutlet var txtSaturdayFrom: ACFloatingTextfield!
    @IBOutlet var txtSaturdayTo: ACFloatingTextfield!
    
    
    @IBOutlet var SundayButt: UIButton!
    @IBOutlet var SundayAddButt: UIButton!
    @IBOutlet var SundayImg: UIImageView!
    @IBOutlet var SundayView: UIView!
    @IBOutlet var SundayHeightConstant: NSLayoutConstraint!
    @IBOutlet var txtSundayFrom: ACFloatingTextfield!
    @IBOutlet var txtSundayTo: ACFloatingTextfield!
    
    
    var Strname = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllClinicLab.text = Strname
        txtMondayFrom.text = ""
        txtMondayTo.text = ""
        txtTuesdayFrom.text = ""
        txtTuesdayTo.text = ""
        txtWednesdayFrom.text = ""
        txtWednesdayTo.text = ""
        txtThursdayFrom.text = ""
        txtThursdayTo.text = ""
        txtFridayFrom.text = ""
        txtFridayTo.text = ""
        txtSaturdayFrom.text = ""
        txtSaturdayTo.text = ""
        txtSundayFrom.text = ""
        txtSundayTo.text = ""
        
        MondayHeightConstant.constant = 0
        TuesdayHeightConstant.constant = 0
        WednesdayHeightConstant.constant = 0
        ThursdayHeightConstant.constant = 0
        FridayHeightConstant.constant = 0
        SaturdayHeightConstant.constant = 0
        SundayHeightConstant.constant = 0
        
        MonDayView.isHidden = true
        TuesdayView.isHidden = true
        WednesdayView.isHidden = true
        ThursdayView.isHidden = true
        FridayView.isHidden = true
        SaturdayView.isHidden = true
        SundayView.isHidden = true
        
        MondayAddButt.isHidden = true
        MondayDownImage.isHidden = false
        TuesdayAddButt.isHidden = true
        TuesdayDownImag.isHidden = false
        WednesdayAddButt.isHidden = true
        WednesdayImag.isHidden = false
        ThursdayAddButt.isHidden = true
        ThursdayImg.isHidden = false
        FridayAddButt.isHidden = true
        FridayImg.isHidden = false
        SaturdayAddButt.isHidden = true
        SaturdayImg.isHidden = false
        SundayAddButt.isHidden = true
        SundayImg.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FeeSegment.selectedSegmentIndex = 1
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
    self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK:  list All Clinic Clicked
    @IBAction func listAllClinicClicked(_ sender: UIButton)
    {
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        
        let cameraction = UIAlertAction(title: "Virtual Dental Care", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            self.AllClinicLab.text = "Virtual Dental Care"
        })
        
        let cameraction2 = UIAlertAction(title: "Universal Dental Group", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            self.AllClinicLab.text = "Universal Dental Group"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(cameraction)
        optionMenu.addAction(cameraction2)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            let popOverPresentationController : UIPopoverPresentationController = optionMenu.popoverPresentationController!
            popOverPresentationController.sourceView                = ClinicButt
            popOverPresentationController.sourceRect                = ClinicButt.bounds
            popOverPresentationController.permittedArrowDirections  = UIPopoverArrowDirection.any
        }
    }
    
    
    // MARK:  Segment Changed
    @IBAction func SegmentChanged(_ sender: UISegmentedControl)
    {
        if FeeSegment.selectedSegmentIndex == 0
        {
            FeeSegment.selectedSegmentIndex = 0
            self.navigationController?.popViewController(animated: false)
        }
        else if FeeSegment.selectedSegmentIndex == 1
        {
            FeeSegment.selectedSegmentIndex = 1
        }
    }
    
     // MARK:  Monday Butt Clicked
    @IBAction func MondayButtClicked(_ sender: UIButton)
    {
        MondayHeightConstant.constant = 130
        TuesdayHeightConstant.constant = 0
        WednesdayHeightConstant.constant = 0
        ThursdayHeightConstant.constant = 0
        FridayHeightConstant.constant = 0
        SaturdayHeightConstant.constant = 0
        SundayHeightConstant.constant = 0
        
        MondayAddButt.isHidden = false
        MondayDownImage.isHidden = true
        TuesdayAddButt.isHidden = true
        TuesdayDownImag.isHidden = false
        WednesdayAddButt.isHidden = true
        WednesdayImag.isHidden = false
        ThursdayAddButt.isHidden = true
        ThursdayImg.isHidden = false
        FridayAddButt.isHidden = true
        FridayImg.isHidden = false
        SaturdayAddButt.isHidden = true
        SaturdayImg.isHidden = false
        SundayAddButt.isHidden = true
        SundayImg.isHidden = false
        
        MonDayView.isHidden = false
        TuesdayView.isHidden = true
        WednesdayView.isHidden = true
        ThursdayView.isHidden = true
        FridayView.isHidden = true
        SaturdayView.isHidden = true
        SundayView.isHidden = true
    }
    
     // MARK:  Tuesday Butt Clicked
    @IBAction func TuesdayButtClicked(_ sender: UIButton)
    {
        MondayHeightConstant.constant = 0
        TuesdayHeightConstant.constant = 130
        WednesdayHeightConstant.constant = 0
        ThursdayHeightConstant.constant = 0
        FridayHeightConstant.constant = 0
        SaturdayHeightConstant.constant = 0
        SundayHeightConstant.constant = 0
        
        MondayAddButt.isHidden = true
        MondayDownImage.isHidden = false
        TuesdayAddButt.isHidden = false
        TuesdayDownImag.isHidden = true
        WednesdayAddButt.isHidden = true
        WednesdayImag.isHidden = false
        ThursdayAddButt.isHidden = true
        ThursdayImg.isHidden = false
        FridayAddButt.isHidden = true
        FridayImg.isHidden = false
        SaturdayAddButt.isHidden = true
        SaturdayImg.isHidden = false
        SundayAddButt.isHidden = true
        SundayImg.isHidden = false
        
        MonDayView.isHidden = true
        TuesdayView.isHidden = false
        WednesdayView.isHidden = true
        ThursdayView.isHidden = true
        FridayView.isHidden = true
        SaturdayView.isHidden = true
        SundayView.isHidden = true
    }
    
    // MARK:  Wedness Butt Clicked
    @IBAction func WednessButtClicked(_ sender: UIButton)
    {
        MondayHeightConstant.constant = 0
        TuesdayHeightConstant.constant = 0
        WednesdayHeightConstant.constant = 130
        ThursdayHeightConstant.constant = 0
        FridayHeightConstant.constant = 0
        SaturdayHeightConstant.constant = 0
        SundayHeightConstant.constant = 0
        
        MondayAddButt.isHidden = true
        MondayDownImage.isHidden = false
        TuesdayAddButt.isHidden = true
        TuesdayDownImag.isHidden = false
        WednesdayAddButt.isHidden = false
        WednesdayImag.isHidden = true
        ThursdayAddButt.isHidden = true
        ThursdayImg.isHidden = false
        FridayAddButt.isHidden = true
        FridayImg.isHidden = false
        SaturdayAddButt.isHidden = true
        SaturdayImg.isHidden = false
        SundayAddButt.isHidden = true
        SundayImg.isHidden = false
        
        MonDayView.isHidden = true
        TuesdayView.isHidden = true
        WednesdayView.isHidden = false
        ThursdayView.isHidden = true
        FridayView.isHidden = true
        SaturdayView.isHidden = true
        SundayView.isHidden = true
    }
    
    // MARK:  Thursday Butt Clicked
    @IBAction func ThursdayButtClicked(_ sender: UIButton)
    {
        MondayHeightConstant.constant = 0
        TuesdayHeightConstant.constant = 0
        WednesdayHeightConstant.constant = 0
        ThursdayHeightConstant.constant = 130
        FridayHeightConstant.constant = 0
        SaturdayHeightConstant.constant = 0
        SundayHeightConstant.constant = 0
        
        MondayAddButt.isHidden = true
        MondayDownImage.isHidden = false
        TuesdayAddButt.isHidden = true
        TuesdayDownImag.isHidden = false
        WednesdayAddButt.isHidden = true
        WednesdayImag.isHidden = false
        ThursdayAddButt.isHidden = false
        ThursdayImg.isHidden = true
        FridayAddButt.isHidden = true
        FridayImg.isHidden = false
        SaturdayAddButt.isHidden = true
        SaturdayImg.isHidden = false
        SundayAddButt.isHidden = true
        SundayImg.isHidden = false
        
        MonDayView.isHidden = true
        TuesdayView.isHidden = true
        WednesdayView.isHidden = true
        ThursdayView.isHidden = false
        FridayView.isHidden = true
        SaturdayView.isHidden = true
        SundayView.isHidden = true
    }
    
    // MARK:  Friday Butt Clicked
    @IBAction func FridayButtClicked(_ sender: UIButton)
    {
        MondayHeightConstant.constant = 0
        TuesdayHeightConstant.constant = 0
        WednesdayHeightConstant.constant = 0
        ThursdayHeightConstant.constant = 0
        FridayHeightConstant.constant = 130
        SaturdayHeightConstant.constant = 0
        SundayHeightConstant.constant = 0
        
        MondayAddButt.isHidden = true
        MondayDownImage.isHidden = false
        TuesdayAddButt.isHidden = true
        TuesdayDownImag.isHidden = false
        WednesdayAddButt.isHidden = true
        WednesdayImag.isHidden = false
        ThursdayAddButt.isHidden = true
        ThursdayImg.isHidden = false
        FridayAddButt.isHidden = false
        FridayImg.isHidden = true
        SaturdayAddButt.isHidden = true
        SaturdayImg.isHidden = false
        SundayAddButt.isHidden = true
        SundayImg.isHidden = false
        
        MonDayView.isHidden = true
        TuesdayView.isHidden = true
        WednesdayView.isHidden = true
        ThursdayView.isHidden = true
        FridayView.isHidden = false
        SaturdayView.isHidden = true
        SundayView.isHidden = true
    }
    
    // MARK:  Saturday Butt Clicked
    @IBAction func SaturdayButtClicked(_ sender: UIButton)
    {
        MondayHeightConstant.constant = 0
        TuesdayHeightConstant.constant = 0
        WednesdayHeightConstant.constant = 0
        ThursdayHeightConstant.constant = 0
        FridayHeightConstant.constant = 0
        SaturdayHeightConstant.constant = 130
        SundayHeightConstant.constant = 0
        
        MondayAddButt.isHidden = true
        MondayDownImage.isHidden = false
        TuesdayAddButt.isHidden = true
        TuesdayDownImag.isHidden = false
        WednesdayAddButt.isHidden = true
        WednesdayImag.isHidden = false
        ThursdayAddButt.isHidden = true
        ThursdayImg.isHidden = false
        FridayAddButt.isHidden = true
        FridayImg.isHidden = false
        SaturdayAddButt.isHidden = false
        SaturdayImg.isHidden = true
        SundayAddButt.isHidden = true
        SundayImg.isHidden = false
        
        MonDayView.isHidden = true
        TuesdayView.isHidden = true
        WednesdayView.isHidden = true
        ThursdayView.isHidden = true
        FridayView.isHidden = true
        SaturdayView.isHidden = false
        SundayView.isHidden = true
    }
    
    // MARK:  Sunday Butt Clicked
    @IBAction func SundayButtClicked(_ sender: UIButton)
    {
        MondayHeightConstant.constant = 0
        TuesdayHeightConstant.constant = 0
        WednesdayHeightConstant.constant = 0
        ThursdayHeightConstant.constant = 0
        FridayHeightConstant.constant = 0
        SaturdayHeightConstant.constant = 0
        SundayHeightConstant.constant = 130
        
        MondayAddButt.isHidden = true
        MondayDownImage.isHidden = false
        TuesdayAddButt.isHidden = true
        TuesdayDownImag.isHidden = false
        WednesdayAddButt.isHidden = true
        WednesdayImag.isHidden = false
        ThursdayAddButt.isHidden = true
        ThursdayImg.isHidden = false
        FridayAddButt.isHidden = true
        FridayImg.isHidden = false
        SaturdayAddButt.isHidden = true
        SaturdayImg.isHidden = false
        SundayAddButt.isHidden = false
        SundayImg.isHidden = true
        
        MonDayView.isHidden = true
        TuesdayView.isHidden = true
        WednesdayView.isHidden = true
        ThursdayView.isHidden = true
        FridayView.isHidden = true
        SaturdayView.isHidden = true
        SundayView.isHidden = false
    }
    
    
    // MARK:  MondayAdd Butt Clicked
    @IBAction func MondayAddClicked(_ sender: UIButton)
    {
        
    }
    
     // MARK:  TuesdayAdd Butt Clicked
    @IBAction func TuesdayAddClicked(_ sender: UIButton)
    {
        
    }
    
     // MARK:  WednessAdd Butt Clicked
    @IBAction func WednessAddClicked(_ sender: UIButton)
    {
        
    }
    
     // MARK:  ThursdayAdd Butt Clicked
    @IBAction func ThursdayAddClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  FridayAdd Butt Clicked
    @IBAction func FridayAddClicked(_ sender: UIButton)
    {
        
    }
    
      // MARK:  SaturdayAdd Butt Clicked
    @IBAction func SaturdayAddClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  SundayAdd Butt Clicked
    @IBAction func SundayAddClicked(_ sender: UIButton)
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
