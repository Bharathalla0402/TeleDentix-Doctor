//
//  ChooseDoctorViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 25/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ChooseOptionCell: UICollectionViewCell
{
    @IBOutlet var NameLab: UILabel!
}

class ChooseOptionCell2: UICollectionViewCell
{
    @IBOutlet var NameLab: UILabel!
}



class ChooseDoctorViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var popview = MVPopView()
    var footerView = UIView()
    var Cell:ChooseSelCell!
    var Cell1:ChooseSelCell!
    
    
    
    var StrCheck = String()
    var SelectedLab = UILabel()
    
    @IBOutlet var MoreAddTabl: UITableView!
    
    var TreatementArray: [String] = ["Orthodontist","Endodontist","Pediatric Dentist"]
    var DoctorArray: [String] = ["Dr. Scott Hacking","Dr. Mathew Cry","Dr. Lucie Lui"]
    
    var TreSelArray =  [String]()
    var DocSelArray =  [String]()
    
    @IBOutlet var TreatCollectonCell: UICollectionView!
    @IBOutlet var DoctorCollectionCell: UICollectionView!
    
    var Cell2:ChooseOptionCell2!
    var Cell3:ChooseOptionCell!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Treatmentview()
        
        TreatCollectonCell.isHidden = true
        DoctorCollectionCell.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Notification Butt Clicked
    @IBAction func NotificationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    
    // MARK:  TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 1
        {
            return TreatementArray.count
        }
        else if tableView.tag == 2
        {
            return DoctorArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView.tag == 1
        {
            let identifier = "ChooseSelCell"
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ChooseSelCell
            if Cell == nil
            {
                tableView.register(UINib(nibName: "ChooseSelCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ChooseSelCell
            }
            Cell?.selectionStyle = UITableViewCellSelectionStyle.none
            MoreAddTabl.separatorStyle = .none
            MoreAddTabl.separatorColor = UIColor.clear
            
            Cell.ChooseName.text = TreatementArray[indexPath.row]
            
            
            Cell.ChooseButt.tag = indexPath.row
            Cell.ChooseButt.addTarget(self, action: #selector(self.ChooseButtClicked), for: .touchUpInside)
            
            let strname = TreatementArray[indexPath.row]
            
            if TreSelArray.contains(strname)
            {
                Cell.ClickView.isHidden = false
            }
            else
            {
                Cell.ClickView.isHidden = true
            }
            
            
            return Cell!
        }
        else
        {
            let identifier = "ChooseSelCell"
            Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? ChooseSelCell
            if Cell1 == nil
            {
                tableView.register(UINib(nibName: "ChooseSelCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? ChooseSelCell
            }
            Cell1?.selectionStyle = UITableViewCellSelectionStyle.none
            MoreAddTabl.separatorStyle = .none
            MoreAddTabl.separatorColor = UIColor.clear
            
            Cell1.ChooseName.text = DoctorArray[indexPath.row]
            
            
            Cell1.ChooseButt.tag = indexPath.row
            Cell1.ChooseButt.addTarget(self, action: #selector(self.DoctorButtClicked), for: .touchUpInside)
            
            let strname = DoctorArray[indexPath.row]
            
            if DocSelArray.contains(strname)
            {
                Cell1.ClickView.isHidden = false
            }
            else
            {
                Cell1.ClickView.isHidden = true
            }
            
            
            return Cell1!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.tag == 1
        {
            
        }
        else if tableView.tag == 2
        {
            
        }
    }
    
    
    //MARK: Choose Butt Clicked
    
    @IBAction func ChooseButtClicked(_ sender: UIButton)
    {
        if StrCheck == "1"
        {
            let strname = TreatementArray[sender.tag]
            
            if TreSelArray.contains(strname)
            {
                TreSelArray =  TreSelArray.filter{$0 != strname}
            }
            else
            {
                TreSelArray.append(strname)
            }
            
            let Val:Int = TreSelArray.count
            SelectedLab.text = String(Val)
            
            MoreAddTabl.reloadData()
        }
    }
    
    
    //MARK: Doctor Butt Clicked
    
    @IBAction func DoctorButtClicked(_ sender: UIButton)
    {
        if StrCheck == "2"
        {
            let strname = DoctorArray[sender.tag]
            
            if DocSelArray.contains(strname)
            {
                DocSelArray =  DocSelArray.filter{$0 != strname}
            }
            else
            {
                DocSelArray.append(strname)
            }
            
            let Val:Int = DocSelArray.count
            SelectedLab.text = String(Val)
            
            MoreAddTabl.reloadData()
        }
    }
    
    
    
    
    // MARK:  SelectTreatment Butt Clicked
    @IBAction func SelectTreatmentButtClicked(_ sender: UIButton)
    {
        StrCheck = "1"
        let Val:Int = TreSelArray.count
        SelectedLab.text = String(Val)
        MoreAddTabl.tag = 1
        popview.show(in: self.view)
        MoreAddTabl.reloadData()
    }
    
    
    func Treatmentview()
    {
        popview.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height)
        popview.backgroundColor=UIColor(patternImage: UIImage(named: "BGM")!)
        // self.view.addSubview(popview)
        // popview.animShow()
        
        footerView.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height)
        footerView.backgroundColor = UIColor.clear
        popview.addSubview(footerView)
        
        
        let DoneView = UIView()
        DoneView.frame = CGRect(x:10, y:self.view.frame.size.height-330, width:self.view.frame.size.width-20, height:60)
        DoneView.backgroundColor = UIColor.white
        DoneView.layer.cornerRadius = 8.0
        DoneView.clipsToBounds = true
        footerView.addSubview(DoneView)
        
        SelectedLab.frame = CGRect(x:10, y:15, width:30, height:30)
        SelectedLab.text = "0"
        SelectedLab.backgroundColor = #colorLiteral(red: 0, green: 0.3647058824, blue: 0.862745098, alpha: 1)
        SelectedLab.textColor = UIColor.white
        SelectedLab.layer.cornerRadius = 15.0
        SelectedLab.clipsToBounds = true
        SelectedLab.textAlignment = .center
        DoneView.addSubview(SelectedLab)
        
        let Selectlabtxt = UILabel()
        Selectlabtxt.frame = CGRect(x:45, y:15, width:100, height:30)
        Selectlabtxt.text = "Selected"
        Selectlabtxt.textAlignment = .left
        DoneView.addSubview(Selectlabtxt)
        
        
        let Donebutt = UIButton()
        Donebutt.frame = CGRect(x:DoneView.frame.size.width-100, y:10, width:90, height:40)
        Donebutt.setTitle("Done", for: .normal)
        Donebutt.setTitleColor(UIColor.blue, for:.normal)
        Donebutt.contentHorizontalAlignment = .right
        Donebutt.addTarget(self, action:#selector(self.DoneButtonAction(_:)), for: .touchUpInside)
        DoneView.addSubview(Donebutt)
        
        
        
        MoreAddTabl = UITableView()
        MoreAddTabl.frame = CGRect(x: 10, y: self.view.frame.size.height-260, width: self.view.frame.size.width-20, height: 180)
        MoreAddTabl.delegate = self
        MoreAddTabl.dataSource = self
        MoreAddTabl.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        MoreAddTabl.backgroundColor = UIColor.clear
        MoreAddTabl.backgroundColor = UIColor.white
        MoreAddTabl.layer.cornerRadius = 8.0
        MoreAddTabl.clipsToBounds = true
        footerView.addSubview(MoreAddTabl)
        
        let ButtonView = UIView()
        ButtonView.frame = CGRect(x:10, y:self.view.frame.size.height-70, width:self.view.frame.size.width-20, height:60)
        ButtonView.backgroundColor = UIColor.white
        ButtonView.layer.cornerRadius = 8.0
        ButtonView.clipsToBounds = true
        footerView.addSubview(ButtonView)
        
        let submitbutt = UIButton()
        submitbutt.frame = CGRect(x:0, y:0, width:ButtonView.frame.size.width, height:ButtonView.frame.size.height)
        submitbutt.setTitle("Cancel", for: .normal)
        submitbutt.setTitleColor(UIColor.blue, for:.normal)
        submitbutt.contentHorizontalAlignment = .center
        submitbutt.addTarget(self, action:#selector(self.CalButtonAction(_:)), for: .touchUpInside)
        ButtonView.addSubview(submitbutt)
    }
    
    @objc func CalButtonAction(_ sender: UIButton!)
    {
        popview.dismiss()
    }
    
    @objc func DoneButtonAction(_ sender: UIButton!)
    {
        popview.dismiss()
        
        if StrCheck == "1"
        {
            print(TreSelArray)
            
            if TreSelArray.count == 0
            {
                TreatCollectonCell.isHidden = true
            }
            else
            {
                TreatCollectonCell.isHidden = false
                TreatCollectonCell.reloadData()
            }
        }
        else
        {
            print(DocSelArray)
            
            if DocSelArray.count == 0
            {
                DoctorCollectionCell.isHidden = true
            }
            else
            {
                DoctorCollectionCell.isHidden = false
                DoctorCollectionCell.reloadData()
            }
        }
    }
    
    
    
    
    // MARK:  ChooseDoctor Butt Clicked
    @IBAction func ChooseDoctorButtClicked(_ sender: UIButton)
    {
        StrCheck = "2"
        let Val:Int = DocSelArray.count
        SelectedLab.text = String(Val)
        MoreAddTabl.tag = 2
        popview.show(in: self.view)
        MoreAddTabl.reloadData()
    }
    
    
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == TreatCollectonCell
        {
            return self.TreSelArray.count
        }
        return self.DocSelArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 150 , height: 40)
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == TreatCollectonCell
        {
            Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseOptionCell2", for: indexPath) as! ChooseOptionCell2
            let strname = TreSelArray[indexPath.row]
            print(strname)
            Cell2.NameLab.text! = strname
            return Cell2
        }
        else
        {
            Cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseOptionCell", for: indexPath) as! ChooseOptionCell
            Cell3.NameLab.text! = DocSelArray[indexPath.row]
            
            return Cell3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == TreatCollectonCell
        {
            StrCheck = "1"
            let Val:Int = TreSelArray.count
            SelectedLab.text = String(Val)
            MoreAddTabl.tag = 1
            popview.show(in: self.view)
            MoreAddTabl.reloadData()
        }
        else
        {
            StrCheck = "2"
            let Val:Int = DocSelArray.count
            SelectedLab.text = String(Val)
            MoreAddTabl.tag = 2
            popview.show(in: self.view)
            MoreAddTabl.reloadData()
        }
    }
    
    
    
    // MARK:  Previous Butt Clicked
    @IBAction func PreviousButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Next Butt Clicked
    @IBAction func NextButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectDatesViewController") as? SelectDatesViewController
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
