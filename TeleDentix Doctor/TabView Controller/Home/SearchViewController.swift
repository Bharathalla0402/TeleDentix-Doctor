//
//  SearchViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 20/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell
{
    @IBOutlet var UserImg: UIImageView!
    @IBOutlet var UserName: UILabel!
}


class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate
{

    @IBOutlet var UserSearchbar: UISearchBar!
    @IBOutlet var SearchTabl: UITableView!
    
    var Cell:NameCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          UserSearchbar.delegate = self

        // Do any additional setup after loading the view.
        
         self.addDoneButtonOnKeyboard()
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
    
     // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
       self.navigationController?.popViewController(animated: false)
    }
    
    
    // MARK:  TableView Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
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
        let identifier = "NameCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? NameCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "NameCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? NameCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        SearchTabl.separatorStyle = .none
        SearchTabl.separatorColor = UIColor.clear
        
        if indexPath.row == 0
        {
             Cell.UserName.text = "Bharath"
        }
        else if indexPath.row == 1
        {
            Cell.UserName.text = "bharath.think360@gmail.com"
        }
        else
        {
            Cell.UserName.text = "9848022338"
        }
       
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "PatientProfileViewController") as? PatientProfileViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if section == 0
        {
            return 0
        }
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 25, width:
            tableView.bounds.size.width, height: 60))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 19)
        headerLabel.textColor = UIColor.black
        if section == 0
        {
             headerLabel.text = ""
        }
        else
        {
            headerLabel.text = "Recent Searches"
        }
       
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
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
