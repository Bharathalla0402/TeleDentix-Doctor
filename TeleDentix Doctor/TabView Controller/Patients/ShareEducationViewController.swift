//
//  ShareEducationViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 30/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ShareEduCell: UITableViewCell
{
    @IBOutlet var EducationName: UILabel!
    @IBOutlet var EducationCategory: UILabel!
    @IBOutlet var ViewButt: UIButton!
    @IBOutlet var SelectView: UIView!
}

class ShareEducationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var NameSearchbar: UISearchBar!
    @IBOutlet weak var ShareEduTabl: UITableView!
    var Cell:ShareEduCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShareEduTabl.rowHeight = UITableViewAutomaticDimension
        ShareEduTabl.estimatedRowHeight = 130
        ShareEduTabl.tableFooterView = UIView()
        
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
        
        self.NameSearchbar.inputAccessoryView = doneToolbar
    }
    
    
    @objc func doneButtonAction()
    {
        NameSearchbar?.resignFirstResponder()
        NameSearchbar.text = ""
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
        NameSearchbar?.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    // MARK:  Back Butt Clicked
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
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = "ShareEduCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ShareEduCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "ShareEduCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ShareEduCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        ShareEduTabl.separatorStyle = .none
        ShareEduTabl.separatorColor = UIColor.clear
        
        Cell.ViewButt.layer.borderWidth = 1.0
        Cell.ViewButt.layer.borderColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
        
        
        Cell.ViewButt.tag = indexPath.row
        Cell.ViewButt.addTarget(self, action: #selector(self.viewDetailButtClicked), for: .touchUpInside)
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    //MARK: Next Booking Appointment Clicked
    
    @IBAction func viewDetailButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "EducationDetailViewController") as? EducationDetailViewController
        myVC?.strCheck = "1"
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    @IBAction func ShareButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
