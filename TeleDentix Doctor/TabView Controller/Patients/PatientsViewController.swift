//
//  PatientsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 19/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class PatientCell: UITableViewCell
{
    @IBOutlet weak var PatientImage: UIImageView!
    @IBOutlet weak var PatientName: UILabel!
    @IBOutlet weak var PatientAge: UILabel!
    @IBOutlet weak var PatientAddress: UILabel!
}


class PatientsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var PatientSegControl: UISegmentedControl!
    @IBOutlet weak var PatientTabl: UITableView!
    @IBOutlet var PatientSearchBar: UISearchBar!
    
    let arrImg: [UIImage] = [UIImage(named: "UserDummy")!,
                             UIImage(named: "UserDummy2")!,
                             UIImage(named: "UserDummy3")!,
                             ]
    
    var arrTitle: [String] = ["Matt Morgon","Alex Pinn","Jeff Robinson"]
    var arrTitle2: [String] = ["Jeff Robinson","Alex Pinn","Matt Morgon"]
    
    var Cell:PatientCell!
    var Cell2:PatientCell!
    var Cell3:PatientCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PatientSearchBar.delegate = self
        
        PatientTabl.rowHeight = UITableViewAutomaticDimension
        PatientTabl.estimatedRowHeight = 130
        PatientTabl.tableFooterView = UIView()
        PatientTabl.tag = 1
        
        self.addDoneButtonOnKeyboard()
        // Do any additional setup after loading the view.
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.PatientSearchBar.inputAccessoryView = doneToolbar
    }
    
    
    @objc func doneButtonAction()
    {
        PatientSearchBar?.resignFirstResponder()
        PatientSearchBar.text = ""
    }
    
    // MARK:  Searchbar Delegate Methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
    {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        PatientSearchBar?.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    
    
    // MARK:  Add Patient Clicked
    @IBAction func AddPatientButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AddPatientViewController") as? AddPatientViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Notification Clicked
    @IBAction func NotificationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  PatientSeg Clicked
    
    @IBAction func PatientSegChanged(_ sender: UISegmentedControl)
    {
        if PatientSegControl.selectedSegmentIndex == 0
        {
            PatientSegControl.selectedSegmentIndex = 0
            PatientTabl.tag = 1
            PatientTabl.reloadData()
        }
        else if PatientSegControl.selectedSegmentIndex == 1
        {
            PatientSegControl.selectedSegmentIndex = 1
            PatientTabl.tag = 2
            PatientTabl.reloadData()
        }
        else if PatientSegControl.selectedSegmentIndex == 2
        {
            PatientSegControl.selectedSegmentIndex = 2
            PatientTabl.tag = 3
            PatientTabl.reloadData()
        }
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
        if tableView.tag == 1
        {
            let identifier = "PatientCell"
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientCell
            if Cell == nil
            {
                tableView.register(UINib(nibName: "PatientCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientCell
            }
            Cell?.selectionStyle = UITableViewCellSelectionStyle.none
            PatientTabl.separatorStyle = .none
            PatientTabl.separatorColor = UIColor.clear
            
            Cell.PatientName.text = arrTitle[indexPath.row]
            Cell.PatientImage.image = arrImg[indexPath.row]
            Cell.PatientAddress.textColor = #colorLiteral(red: 0.6077815294, green: 0.607886374, blue: 0.6077676415, alpha: 1)
            
            Cell.PatientAddress.text = "California, USA"
            
            return Cell!
        }
        else if tableView.tag == 2
        {
            let identifier = "PatientCell"
            Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientCell
            if Cell2 == nil
            {
                tableView.register(UINib(nibName: "PatientCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientCell
            }
            Cell2?.selectionStyle = UITableViewCellSelectionStyle.none
            PatientTabl.separatorStyle = .none
            PatientTabl.separatorColor = UIColor.clear
            
            Cell2.PatientName.text = arrTitle[indexPath.row]
            Cell2.PatientImage.image = arrImg[indexPath.row]
            
            
            let strokeTextAttributes: [NSAttributedStringKey: Any] = [
                .foregroundColor :  #colorLiteral(red: 0.6077815294, green: 0.607886374, blue: 0.6077676415, alpha: 1),
                .font : UIFont.systemFont(ofSize: 17)
            ]
            
            let strokeTextAttributes2: [NSAttributedStringKey: Any] = [
                .foregroundColor : UIColor(red: 58.0/255, green: 190.0/255, blue: 122.0/255, alpha: 1.0),
                .font : UIFont.systemFont(ofSize: 17)
            ]
            
            let strtext5 = "Dr.Scott Hacking "
            let strtext6 = "| California, USA "
            let mutableAttributedString2 = NSMutableAttributedString()
            let regularAttributedString2 = NSAttributedString(string: strtext5, attributes: strokeTextAttributes)
            let boldAttributedString22 = NSAttributedString(string: strtext6, attributes: strokeTextAttributes2)
            mutableAttributedString2.append(regularAttributedString2)
            mutableAttributedString2.append(boldAttributedString22)
            Cell2.PatientAddress.attributedText = mutableAttributedString2
            
            
            return Cell2!
        }
        else
        {
            let identifier = "PatientCell"
            Cell3 = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientCell
            if Cell3 == nil
            {
                tableView.register(UINib(nibName: "PatientCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell3 = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientCell
            }
            Cell3?.selectionStyle = UITableViewCellSelectionStyle.none
            PatientTabl.separatorStyle = .none
            PatientTabl.separatorColor = UIColor.clear
            
            Cell3.PatientName.text = arrTitle2[indexPath.row]
            Cell3.PatientImage.image = arrImg[indexPath.row]
            
            
            let strokeTextAttributes: [NSAttributedStringKey: Any] = [
                .foregroundColor :  #colorLiteral(red: 0.6077815294, green: 0.607886374, blue: 0.6077676415, alpha: 1),
                .font : UIFont.systemFont(ofSize: 17)
            ]
            
            let strokeTextAttributes2: [NSAttributedStringKey: Any] = [
                .foregroundColor : UIColor(red: 58.0/255, green: 190.0/255, blue: 122.0/255, alpha: 1.0),
                .font : UIFont.systemFont(ofSize: 17)
            ]
            
            let strtext5 = "Dr.Scott Hacking "
            let strtext6 = "| California, USA "
            let mutableAttributedString2 = NSMutableAttributedString()
            let regularAttributedString2 = NSAttributedString(string: strtext5, attributes: strokeTextAttributes)
            let boldAttributedString22 = NSAttributedString(string: strtext6, attributes: strokeTextAttributes2)
            mutableAttributedString2.append(regularAttributedString2)
            mutableAttributedString2.append(boldAttributedString22)
            Cell3.PatientAddress.attributedText = mutableAttributedString2
            
            return Cell3!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "PatientProfileViewController") as? PatientProfileViewController
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
