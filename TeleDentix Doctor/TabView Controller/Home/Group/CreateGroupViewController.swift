//
//  CreateGroupViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 27/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var ImageButt: UIButton!
    @IBOutlet weak var GroupImage: UIImageView!
    @IBOutlet weak var PublicView: UIView!
    @IBOutlet weak var PrivateView: UIView!
    
    var imagePicker = UIImagePickerController()
    
    var strCheckCondition = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Image Butt Clicked
    @IBAction func ImageButtClicked(_ sender: UIButton)
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
            popOverPresentationController.sourceView                = ImageButt
            popOverPresentationController.sourceRect                = ImageButt.bounds
            popOverPresentationController.permittedArrowDirections  = UIPopoverArrowDirection.any
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        GroupImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }

    

    // MARK:  Public Butt Clicked
    @IBAction func PublicButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Private Butt Clicked
    @IBAction func PrivateButtClicked(_ sender: UIButton)
    {
        
    }
    
     // MARK:  Next Butt Clicked
    @IBAction func NextButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AddDoctorsGroupViewController") as? AddDoctorsGroupViewController
         myVC?.strCheckCondition = strCheckCondition
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
