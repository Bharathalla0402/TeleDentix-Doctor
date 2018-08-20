//
//  AppointmentsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 19/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class UserCell2: UITableViewCell
{
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserSessionType: UILabel!
    @IBOutlet var UserAddress: UILabel!
    @IBOutlet var SelectView: UIView!
    @IBOutlet var UserAppointTime: UILabel!
}

class DateCell2: UICollectionViewCell
{
    @IBOutlet var WeekNameLab: UILabel!
    @IBOutlet var WeekDateLab: UILabel!
}

class AppointmentsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet var DateCollectionView: UICollectionView!
    @IBOutlet var DateCollectionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var BookingSegControl: UISegmentedControl!
    @IBOutlet weak var BookingTabl: UITableView!
    @IBOutlet var TablHeightConst: NSLayoutConstraint!
    
    let arrImg: [UIImage] = [UIImage(named: "UserDummy")!,
                             UIImage(named: "UserDummy2")!,
                             UIImage(named: "UserDummy3")!,
                             ]
    
    var arrTitle: [String] = ["Matt Morgon","Alex Pinn","Jeff Robinson"]
    var arrTitle2: [String] = ["Jeff Robinson","Alex Pinn","Matt Morgon"]
    
    var arrMorTime: [String] = ["09:15 AM","10:15 AM","11:15 AM"]
    var arrEveTime: [String] = ["04:15 PM","05:15 PM","06:15 PM"]
    
    var Cell1:UserCell2!
    var Cell2:UserCell2!
    var Cell:DateCell2!
    
    var WeekDayArray = [String]()
    var DateArray = [String]()
    var StrWeekDay = String()
    
    @IBOutlet var UserSearchbar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BookingTabl.rowHeight = UITableViewAutomaticDimension
        BookingTabl.estimatedRowHeight = 130
        BookingTabl.tableFooterView = UIView()
        BookingTabl.tag = 1
        
        UserSearchbar.isHidden = true
        
        self.addDoneButtonOnKeyboard()
        
        getLast7Dates()
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
        UserSearchbar?.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    
    // MARK:  Get Next 15 Days
    
    func getLast7Dates()
    {
        DateArray.removeAll()
        WeekDayArray.removeAll()
        let cal = Calendar.current
        let date = cal.startOfDay(for: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "E"
        
        for i in 0 ... 14
        {
            let newdate = cal.date(byAdding: .day, value: i, to: date)!
            let str = dateFormatter.string(from: newdate)
            DateArray.append(str)
            
            let str2 = dateFormatter2.string(from: newdate)
            let strchar:String = String(str2.prefix(1))
            WeekDayArray.append(strchar)
        }
        print(WeekDayArray)
        print(DateArray)
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
    
    // MARK:  Appointment Seg Changed
    @IBAction func AppointmentSegChanged(_ sender: UISegmentedControl){
        if BookingSegControl.selectedSegmentIndex == 0
        {
            TablHeightConst.constant = 100
            UserSearchbar.isHidden = true
            DateCollectionView.isHidden = false
            
            BookingSegControl.selectedSegmentIndex = 0
            BookingTabl.tag = 1
            BookingTabl.reloadData()
        }
        else if BookingSegControl.selectedSegmentIndex == 1
        {
            TablHeightConst.constant = 56
            UserSearchbar.isHidden = false
            DateCollectionView.isHidden = true
            
            BookingSegControl.selectedSegmentIndex = 1
            BookingTabl.tag = 2
            BookingTabl.reloadData()
        }
    }
    
    
    
    // MARK:  TableView Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
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
        if tableView.tag == 1
        {
            let identifier = "UserCell2"
            Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? UserCell2
            if Cell1 == nil
            {
                tableView.register(UINib(nibName: "UserCell2", bundle: nil), forCellReuseIdentifier: identifier)
                Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? UserCell2
            }
            Cell1?.selectionStyle = UITableViewCellSelectionStyle.none
            BookingTabl.separatorStyle = .none
            BookingTabl.separatorColor = UIColor.clear
            
            if indexPath.row == 0
            {
                if indexPath.section == 0
                {
                    Cell1.UserSessionType.text = "Running Session"
                    Cell1.UserSessionType.textColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
                    Cell1.SelectView.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
                }
                else
                {
                    Cell1.SelectView.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.6509803922, alpha: 1)
                    Cell1.UserSessionType.textColor = UIColor.black
                    Cell1.UserSessionType.text = "Waiting"
                }
            }
            else
            {
                Cell1.SelectView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
                Cell1.UserSessionType.textColor = UIColor.black
                Cell1.UserSessionType.text = "Waiting"
            }
            
            if indexPath.section == 0
            {
                Cell1.UserAppointTime.text = arrMorTime[indexPath.row]
            }
            else
            {
                Cell1.UserAppointTime.text = arrEveTime[indexPath.row]
            }
            
            return Cell1!
        }
        else
        {
            let identifier = "UserCell2"
            Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? UserCell2
            if Cell2 == nil
            {
                tableView.register(UINib(nibName: "UserCell2", bundle: nil), forCellReuseIdentifier: identifier)
                Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? UserCell2
            }
            Cell2?.selectionStyle = UITableViewCellSelectionStyle.none
            BookingTabl.separatorStyle = .none
            BookingTabl.separatorColor = UIColor.clear
            
            Cell2.SelectView.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
            Cell2.UserSessionType.text = "California, USA"
            Cell2.UserSessionType.textColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
            
            Cell2.UserAddress.text = "27 Yrs"
            Cell2.UserAddress.textColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
            
            if indexPath.section == 0
            {
                Cell2.UserAppointTime.text = arrMorTime[indexPath.row]
            }
            else
            {
                Cell2.UserAppointTime.text = arrEveTime[indexPath.row]
            }
            
            
            return Cell2!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AppointmentInfoViewController") as? AppointmentInfoViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 10, width:
            self.view.bounds.size.width-60, height: 25))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headerLabel.textAlignment = .center
        headerLabel.textColor = UIColor.black
        if section == 0
        {
            if tableView.tag == 1
            {
                headerLabel.text = "Morning"
            }
            else
            {
                headerLabel.text = "Today"
            }
        }
        else
        {
            if tableView.tag == 1
            {
                headerLabel.text = "Evening"
            }
            else
            {
                headerLabel.text = "Yesterday"
            }
        }
        
        // headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.DateArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.view.bounds.size.width/7-(40/7) , height: 90)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell2", for: indexPath) as! DateCell2
        Cell.WeekNameLab.text = WeekDayArray[indexPath.row]
        Cell.WeekDateLab.text = DateArray[indexPath.row]
        
        let str = DateArray[indexPath.row]
        if str == StrWeekDay
        {
            Cell.WeekDateLab.backgroundColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
            Cell.WeekDateLab.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        else
        {
            Cell.WeekDateLab.backgroundColor = UIColor.clear
            Cell.WeekDateLab.textColor = UIColor.black
        }
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        StrWeekDay = DateArray[indexPath.row]
        DateCollectionView.reloadData()
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
