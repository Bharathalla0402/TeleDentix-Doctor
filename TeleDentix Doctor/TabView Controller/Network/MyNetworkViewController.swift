//
//  MyNetworkViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 02/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit



class MyNetworkViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet var NetworkSegment: UISegmentedControl!
    @IBOutlet var DoctorSearchBar: UISearchBar!
    @IBOutlet var NetworkTabl: UITableView!
    @IBOutlet var TablTopHeight: NSLayoutConstraint!
    
    var Cell:ConnectedDocsCell!
    var Cell1:RequestCell!
    var Cell2:RequestCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        
        NetworkTabl.rowHeight = UITableViewAutomaticDimension
        NetworkTabl.estimatedRowHeight = 130
        NetworkTabl.tableFooterView = UIView()
        NetworkTabl.tag = 1
        
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
        
        self.DoctorSearchBar.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        DoctorSearchBar?.resignFirstResponder()
        DoctorSearchBar.text = ""
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
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar)
    {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        DoctorSearchBar?.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    
    
    
     // MARK:  Back butt clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Segment Changed
    @IBAction func SegChanged(_ sender: UISegmentedControl)
    {
        if NetworkSegment.selectedSegmentIndex == 0
        {
            TablTopHeight.constant = 56
            DoctorSearchBar.isHidden = false
            NetworkSegment.selectedSegmentIndex = 0
            NetworkTabl.tag = 1
            NetworkTabl.reloadData()
        }
        else if NetworkSegment.selectedSegmentIndex == 1
        {
            TablTopHeight.constant = 0
            DoctorSearchBar.isHidden = true
            NetworkSegment.selectedSegmentIndex = 1
            NetworkTabl.tag = 2
            NetworkTabl.reloadData()
        }
        else if NetworkSegment.selectedSegmentIndex == 2
        {
            TablTopHeight.constant = 0
            DoctorSearchBar.isHidden = true
            NetworkSegment.selectedSegmentIndex = 2
            NetworkTabl.tag = 3
            NetworkTabl.reloadData()
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
            let identifier = "ConnectedDocsCell"
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ConnectedDocsCell
            if Cell == nil
            {
                tableView.register(UINib(nibName: "ConnectedDocsCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ConnectedDocsCell
            }
            Cell?.selectionStyle = UITableViewCellSelectionStyle.none
            NetworkTabl.separatorStyle = .none
            NetworkTabl.separatorColor = UIColor.clear
            
            Cell.UserName.text = "Dr.Matt Morgan"
            Cell.CareName.text = "Healthcenter in San Diego"
            Cell.DoctorQualifycationLab.text = "BDS MDS - Conservative Dentistry"
           
            return Cell!
        }
        else if tableView.tag == 2
        {
            let identifier = "RequestCell"
            Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? RequestCell
            if Cell1 == nil
            {
                tableView.register(UINib(nibName: "RequestCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? RequestCell
            }
            Cell1?.selectionStyle = UITableViewCellSelectionStyle.none
            NetworkTabl.separatorStyle = .none
            NetworkTabl.separatorColor = UIColor.clear
            
            Cell1.AcceptButt.layer.borderWidth = 1.0
            Cell1.AcceptButt.layer.borderColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
            
            Cell1.IgnoreButt.layer.borderWidth = 1.0
            Cell1.IgnoreButt.layer.borderColor = #colorLiteral(red: 0.3647058824, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
            
            Cell1.UserName.text = "Dr.Matt Morgan"
            Cell1.UserQualify.text = "BDS MDS - Conservative Dentistry"
    
            return Cell1!
        }
        else
        {
            let identifier = "RequestCell"
            Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? RequestCell
            if Cell2 == nil
            {
                tableView.register(UINib(nibName: "RequestCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? RequestCell
            }
            Cell2?.selectionStyle = UITableViewCellSelectionStyle.none
            NetworkTabl.separatorStyle = .none
            NetworkTabl.separatorColor = UIColor.clear
            
            Cell2.AcceptButt.layer.borderWidth = 1.0
            Cell2.AcceptButt.layer.borderColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
            
            Cell2.IgnoreButt.layer.borderWidth = 1.0
            Cell2.IgnoreButt.layer.borderColor = #colorLiteral(red: 0.3647058824, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
            
            Cell2.UserName.text = "Dr.Matt Morgan"
            Cell2.UserQualify.text = "BDS MDS - Conservative Dentistry"
            
            return Cell2!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      
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
