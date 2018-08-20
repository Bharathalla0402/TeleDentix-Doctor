//
//  ReferalViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 27/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class PatientUserCell: UITableViewCell
{
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserAge: UILabel!
    @IBOutlet var UserAddress: UILabel!
    @IBOutlet var SelectView: UIView!
}

class ReferalViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet var UserSearchbar: UISearchBar!
    @IBOutlet var UserTabl: UITableView!
    @IBOutlet weak var PatientCountLab: UILabel!
    
    @IBOutlet var NextButt: UIButton!
    var Cell:PatientUserCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserTabl.rowHeight = UITableViewAutomaticDimension
        UserTabl.estimatedRowHeight = 130
        UserTabl.tableFooterView = UIView()
        
        self.addDoneButtonOnKeyboard()
        
        let strokeTextAttributes: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.black,
            .font : UIFont.boldSystemFont(ofSize: 14)
        ]
        
        let strokeTextAttributes2: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.blue,
            .font : UIFont.systemFont(ofSize: 14)
        ]
        
        let strtext = "You have selected "
        let strtext2 = "2 Patients "
        let strtext3 = "for reference"
        
        let mutableAttributedString = NSMutableAttributedString()
        let regularAttributedString = NSAttributedString(string: strtext, attributes: strokeTextAttributes)
        let boldAttributedString = NSAttributedString(string: strtext2, attributes: strokeTextAttributes2)
        let boldAttributedString2 = NSAttributedString(string: strtext3, attributes: strokeTextAttributes)
        mutableAttributedString.append(regularAttributedString)
        mutableAttributedString.append(boldAttributedString)
        mutableAttributedString.append(boldAttributedString2)
        PatientCountLab.attributedText = mutableAttributedString
        
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
        
        self.UserSearchbar.inputAccessoryView = doneToolbar
    }
    
    
    @objc func doneButtonAction()
    {
        UserSearchbar?.resignFirstResponder()
        UserSearchbar.text = ""
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
        UserSearchbar?.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
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
        let identifier = "PatientUserCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientUserCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "PatientUserCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientUserCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        UserTabl.separatorStyle = .none
        UserTabl.separatorColor = UIColor.clear
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    
    
    
    // MARK:  Next Butt Clicked
    @IBAction func NextButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectDoctorViewController") as? SelectDoctorViewController
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
