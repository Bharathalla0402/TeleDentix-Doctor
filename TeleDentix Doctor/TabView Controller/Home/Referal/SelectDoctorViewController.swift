//
//  SelectDoctorViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 27/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class SelectDoctorCell: UITableViewCell
{
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserAddress: UILabel!
    @IBOutlet var SelectView: UIView!
}

class DoctorlistCell: UICollectionViewCell
{
    @IBOutlet weak var DoctorView: UIView!
    @IBOutlet weak var DoctorImage: UIImageView!
    @IBOutlet weak var DoctorName: UILabel!
    @IBOutlet weak var CancelButt: UIButton!
}



class SelectDoctorViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var UserSearchbar: UISearchBar!
    @IBOutlet var UserTabl: UITableView!
    @IBOutlet weak var PatientCountLab: UILabel!
    @IBOutlet weak var DoctorCollectionView: UICollectionView!
    
    @IBOutlet var NextButt: UIButton!
    var Cell:SelectDoctorCell!
    
    var Cell2:DoctorlistCell!
    var DoclistArray =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserTabl.rowHeight = UITableViewAutomaticDimension
        UserTabl.estimatedRowHeight = 130
        UserTabl.tableFooterView = UIView()
        
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
        let identifier = "SelectDoctorCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SelectDoctorCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "SelectDoctorCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SelectDoctorCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        UserTabl.separatorStyle = .none
        UserTabl.separatorColor = UIColor.clear
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 180 , height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "DoctorlistCell", for: indexPath) as! DoctorlistCell
        
        Cell2.DoctorView.layer.borderWidth = 1.0
        Cell2.DoctorView.layer.borderColor = #colorLiteral(red: 0.1445401311, green: 0.3383063674, blue: 0.8815893531, alpha: 1)
        
        Cell2.CancelButt.tag = indexPath.row
        Cell2.CancelButt.addTarget(self, action: #selector(self.CancelButtClicked), for: .touchUpInside)
        
        return Cell2
    }
    
    //MARK:Cancel Butt Clicked
    
    @IBAction func CancelButtClicked(_ sender: UIButton)
    {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    
    
    
    
    // MARK:  Previous Butt Clicked
    @IBAction func PreviousButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Next Butt Clicked
    @IBAction func NextButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ReviewReferalViewController") as? ReviewReferalViewController
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
