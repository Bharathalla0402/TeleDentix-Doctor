//
//  PatientProfileViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 28/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class PatientProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    
    @IBOutlet weak var UserImg: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserNicName: UILabel!
    @IBOutlet var UploadPresButt: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    // MARK:  Notification Clicked
    @IBAction func NotificationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Profile Information Clicked
    @IBAction func ProfileInformationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileInfoViewController") as? ProfileInfoViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Appointment History Clicked
    @IBAction func AppointmentHistoryButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AppointmentHistoryViewController") as? AppointmentHistoryViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Prescripton Butt Clicked
    @IBAction func PrescriptionButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "PrescriptionViewController") as? PrescriptionViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  MedicalRecords Butt Clicked
    @IBAction func MedicalRecordsButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "MedicalRecordsViewController") as? MedicalRecordsViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Education Butt Clicked
    @IBAction func EducationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "EducationListViewController") as? EducationListViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Prescription Butt Clicked
    @IBAction func PrescriptonButtClicked(_ sender: UIButton)
    {
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        
        let pibraryAction = UIAlertAction(title: "Open Camera", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.modalPresentationStyle = .fullScreen
                self.present(self.imagePicker,animated: true,completion: nil)
                
            } else {
                AFWrapperClass.alert(Constants.applicationName, message: "Sorry, this device has no camera", view: self)
            }
            
        })
        let cameraction = UIAlertAction(title: "Open Photo Gallery", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(self.imagePicker, animated: true, completion: nil)
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
            popOverPresentationController.sourceView                = UploadPresButt
            popOverPresentationController.sourceRect                = UploadPresButt.bounds
            popOverPresentationController.permittedArrowDirections  = UIPopoverArrowDirection.any
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:  Medical Record Butt Clicked
    
    @IBAction func MedicalRecordButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AddMedicalRecordViewController") as? AddMedicalRecordViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
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
