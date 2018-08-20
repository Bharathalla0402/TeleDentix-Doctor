//
//  PrescriptionViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 29/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class PrescriptionListCell: UITableViewCell
{
    @IBOutlet weak var PrescriptionName: UILabel!
    @IBOutlet weak var PrescriptionDate: UILabel!
}

class PrescriptionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var PresciptionTabl: UITableView!
    
    @IBOutlet weak var UploadButt: UIButton!
    var imagePicker = UIImagePickerController()
    var Cell:PrescriptionListCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        PresciptionTabl.rowHeight = UITableViewAutomaticDimension
        PresciptionTabl.estimatedRowHeight = 130
        PresciptionTabl.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = "PrescriptionListCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PrescriptionListCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "PrescriptionListCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PrescriptionListCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        PresciptionTabl.separatorStyle = .none
        PresciptionTabl.separatorColor = UIColor.clear
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "PrescriptionNameViewController") as? PrescriptionNameViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Make Prescription Butt Clicked
    @IBAction func MakePrescriptionButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "MakePrescriptionViewController") as? MakePrescriptionViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Upload Prescription Butt Clicked
    @IBAction func UploadPrescriptionButtClicked(_ sender: UIButton)
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
