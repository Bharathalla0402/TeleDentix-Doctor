//
//  AddMedicalRecordViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 30/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class AddRecordCell: UICollectionViewCell
{
    @IBOutlet var RecordImage: UIImageView!
    @IBOutlet var UploadImage: UIImageView!
}


class AddMedicalRecordViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    @IBOutlet var txtRecordName: ACFloatingTextfield!
    @IBOutlet var txtRecordDate: ACFloatingTextfield!
    @IBOutlet var txtRecordNote: ACFloatingTextfield!
    @IBOutlet var UploadRecordTabl: UICollectionView!
    @IBOutlet var SaveRecordButt: UIButton!
    
    var imagePicker = UIImagePickerController()
    var arrImg =  [UIImage]()
    var Cell:AddRecordCell!
    
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
        
        let currentDate: NSDate = NSDate()
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = "dd"
        Strdate = dateFormatter3.string(from: currentDate as Date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        dateString = dateFormatter.string(from: currentDate as Date)
        
        self.txtRecordName.text = ""
        self.txtRecordDate.text = ""
        self.txtRecordNote.text = ""
        
        imagePicker.delegate = self
       
        // Do any additional setup after loading the view.
    }
    
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Record Name Butt Clicked
    @IBAction func RecordNameButtClicked(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "Select Name", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Record 1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtRecordName.text = "Record 1"
        }
        
        let okAction1 = UIAlertAction(title: "Record 2", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtRecordName.text = "Record 2"
        }
        
        let okAction2 = UIAlertAction(title: "Record 3", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtRecordName.text = "Record 3"
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
    
    
    @IBAction func RecordDateButtClicked(_ sender: UIButton)
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
        txtRecordDate.text = strdate
        dropDownView.removeFromSuperview()
    }
    
    
    // MARK:  Record Note Butt Clicked
    @IBAction func RecordNoteButtClicked(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "Select Note", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Note 1", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtRecordNote.text = "Record 1"
        }
        
        let okAction1 = UIAlertAction(title: "Note 2", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtRecordNote.text = "Record 2"
        }
        
        let okAction2 = UIAlertAction(title: "Note 3", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.txtRecordNote.text = "Record 3"
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
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrImg.count+1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 120, height: 120)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddRecordCell", for: indexPath) as! AddRecordCell
        
        if indexPath.row == arrImg.count
        {
            Cell.RecordImage.isHidden = true
            Cell.UploadImage.isHidden = false
        }
        else
        {
            Cell.RecordImage.isHidden = false
            Cell.UploadImage.isHidden = true
            Cell.RecordImage.image = arrImg[indexPath.row]
        }
        
        Cell.contentView.layer.borderWidth = 2.0
        Cell.contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if indexPath.row == arrImg.count
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
                popOverPresentationController.sourceView                = SaveRecordButt
                popOverPresentationController.sourceRect                = SaveRecordButt.bounds
                popOverPresentationController.permittedArrowDirections  = UIPopoverArrowDirection.any
            }
        }
        else
        {
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        arrImg.append( (info[UIImagePickerControllerOriginalImage] as? UIImage)!)
        
        dismiss(animated: true, completion: nil)
        
        UploadRecordTabl.reloadData()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:  Save Record Butt Clicked
    @IBAction func SaveRecordButtClicked(_ sender: UIButton)
    {
        var message = String()
        
        if (txtRecordName.text?.isEmpty)!
        {
            message = "Please Select Record Name"
        }
        else if (txtRecordDate.text?.isEmpty)!
        {
            message = "Please Select Record Date"
        }
        else if (txtRecordNote.text?.isEmpty)!
        {
            message = "Please Select Record Note"
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
