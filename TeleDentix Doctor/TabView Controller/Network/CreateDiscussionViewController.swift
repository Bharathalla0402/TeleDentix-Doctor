//
//  CreateDiscussionViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 03/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class CreateDiscussionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var DiscussionTitle: ACFloatingTextfield!
    @IBOutlet var txtComment: ACFloatingTextfield!
    @IBOutlet var UploadButt: UIButton!
    @IBOutlet var SharedPatientButt: UIButton!
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UploadButt.layer.borderWidth = 1.0
        UploadButt.layer.borderColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
        
        SharedPatientButt.layer.borderWidth = 1.0
        SharedPatientButt.layer.borderColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
        
        DiscussionTitle.text = ""
        txtComment.text = ""
        
        imagePicker.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    
   
    
    
    
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Upload Butt Clicked
    @IBAction func UploadButtClicked(_ sender: UIButton)
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
            popOverPresentationController.sourceView                = UploadButt
            popOverPresentationController.sourceRect                = UploadButt.bounds
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
   
    // MARK:  SharedFromPatient Butt Clicked
    @IBAction func SharedFromPatientButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectMemberViewController") as? SelectMemberViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Create Discuss Butt Clicked
    @IBAction func CreateDisscussButtClicked(_ sender: UIButton)
    {
        var message = String()
        
        if (DiscussionTitle.text?.isEmpty)!
        {
            message = "Please Enter Discussion Title"
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
