//
//  AppointmentDetailViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 31/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class TimeDurCell: UICollectionViewCell
{
    @IBOutlet var TimeDurLab: UILabel!
}


class AppointmentDetailViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var ApproveButt: UIButton!
   
    var StrPop =  String()
    var popview2 =  UIView()
    var footerview2 =  UIView()
    
    var DataCollectionView: UICollectionView?
    
    var MorArray: [String] = ["09:00 AM","09:30 AM","10:00 AM","10:30 AM","11:00 AM","11:30 AM","12:00 PM"]
    var EveArray: [String] = ["02:00 PM","02:30 PM","03:00 PM","03:30 PM","04:00 PM","04:30 PM","05:00 PM"]
    
    var Cell:TimeDurCell!
    var Cell2:TimeDurCell!
    
    var StrMorTime = String()
    var StrEveTime = String()
    
    @IBOutlet var PopUpView: UIView!
    @IBOutlet var txtSessionLab: UILabel!
    @IBOutlet var TimeCollectionView: UICollectionView!
    @IBOutlet var Okbutt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StrMorTime = "09:00 AM"
        StrEveTime = "02:00 PM"
        
        PopUpView.backgroundColor=UIColor(patternImage: UIImage(named: "BGM")!)
        PopUpView.isHidden = true
        TimeCollectionView.tag = 1

        // Do any additional setup after loading the view.
    }
    
     // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Edit Butt Clicked
    @IBAction func EditButtClicked(_ sender: UIButton)
    {
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        
        let pibraryAction = UIAlertAction(title: "Morning", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            self.StrPop = "1"
            self.txtSessionLab.text = "Morning"
            self.PopUpView.isHidden = false
            self.TimeCollectionView.tag = 1
            self.TimeCollectionView.reloadData()
            
        })
        let cameraction = UIAlertAction(title: "Evening", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            self.StrPop = "2"
            self.txtSessionLab.text = "Evening"
            self.PopUpView.isHidden = false
            self.TimeCollectionView.tag = 2
            self.TimeCollectionView.reloadData()
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
            popOverPresentationController.sourceView                = ApproveButt
            popOverPresentationController.sourceRect                = ApproveButt.bounds
            popOverPresentationController.permittedArrowDirections  = UIPopoverArrowDirection.any
        }
    }
    
    @IBAction func OkButtClicked(_ sender: UIButton)
    {
        PopUpView.isHidden = true
    }
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if self.StrPop == "1"
        {
            return self.MorArray.count
        }
        else
        {
            return self.EveArray.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 90 , height: 40)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if self.StrPop == "1"
        {
            Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeDurCell", for: indexPath) as! TimeDurCell
            Cell.TimeDurLab.text = MorArray[indexPath.row]
            
            let str = MorArray[indexPath.row]
            if str == StrMorTime
            {
                Cell.contentView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
                Cell.TimeDurLab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell.contentView.layer.borderWidth = 1.0
                Cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
            }
            else
            {
                Cell.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell.TimeDurLab.textColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
                Cell.contentView.layer.borderWidth = 1.0
                Cell.contentView.layer.borderColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
            }
            
            return Cell
        }
        else
        {
            Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeDurCell", for: indexPath) as! TimeDurCell
            
            Cell2.TimeDurLab.text = EveArray[indexPath.row]
            
            let str = EveArray[indexPath.row]
            if str == StrEveTime
            {
                Cell2.contentView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
                Cell2.TimeDurLab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell2.contentView.layer.borderWidth = 1.0
                Cell2.contentView.layer.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
            }
            else
            {
                Cell2.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell2.TimeDurLab.textColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
                Cell2.contentView.layer.borderWidth = 1.0
                Cell2.contentView.layer.borderColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
            }
            
            return Cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if self.StrPop == "1"
        {
            StrMorTime = MorArray[indexPath.row]
            TimeCollectionView.reloadData()
        }
        else
        {
            StrEveTime = EveArray[indexPath.row]
            TimeCollectionView.reloadData()
        }
    }
    
    
    
    // MARK:  Approve Butt Clicked
    @IBAction func ApproveButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popToRootViewController(animated: true)
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
