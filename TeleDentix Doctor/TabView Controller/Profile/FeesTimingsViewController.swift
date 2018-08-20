//
//  FeesTimingsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 06/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class FeesTimingsViewController: UIViewController {

    @IBOutlet var FeeSegment: UISegmentedControl!
    @IBOutlet var AllClinicLab: UILabel!
    @IBOutlet var ClinicButt: UIButton!
    @IBOutlet var txtFeeVideoConf: ACFloatingTextfield!
    @IBOutlet var txtClinicVisit: ACFloatingTextfield!
    @IBOutlet var txtPaidVideoConf: ACFloatingTextfield!
    @IBOutlet var txtPaidVideoFee: ACFloatingTextfield!
    @IBOutlet var txtFeeConsultDuration: ACFloatingTextfield!
    @IBOutlet var txtPaidConsultFee: ACFloatingTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.AllClinicLab.text = "Virtual Dental Care"
        txtFeeVideoConf.text = ""
        txtClinicVisit.text = ""
        txtPaidVideoConf.text = ""
        txtPaidVideoFee.text = ""
        txtFeeConsultDuration.text = ""
        txtPaidConsultFee.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FeeSegment.selectedSegmentIndex = 0
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
    
     // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:  Segment Changed
    @IBAction func SegmentChanged(_ sender: UISegmentedControl)
    {
        if FeeSegment.selectedSegmentIndex == 0
        {
            FeeSegment.selectedSegmentIndex = 0
        }
        else if FeeSegment.selectedSegmentIndex == 1
        {
            FeeSegment.selectedSegmentIndex = 1
            
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "TimingsViewController") as? TimingsViewController
            myVC?.Strname = self.AllClinicLab.text!
            self.navigationController?.pushViewController(myVC!, animated: false)
        }
    }
    
    
    
     // MARK:  Free Video Conferrencing Butt Clicked
    @IBAction func VideoConferrencingButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Free Clinic Visit Butt Clicked
    @IBAction func FreeClinicVisitButtClicked(_ sender: UIButton)
    {
        
    }
    
     // MARK:  Paid Video Butt Clicked
    @IBAction func PaidVideoConferencingButtClicked(_ sender: UIButton)
    {
        
    }
    
     // MARK:  Paid Consult Duration Clicked
    @IBAction func PaidConsultDurationButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Submit Duration Clicked
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
