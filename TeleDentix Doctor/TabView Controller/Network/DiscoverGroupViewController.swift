//
//  DiscoverGroupViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 04/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
class GroupsCell2: UITableViewCell
{
    @IBOutlet var GroupImg: UIImageView!
    @IBOutlet var GroupName: UILabel!
    @IBOutlet var GroupMembers: UILabel!
    @IBOutlet weak var JoinButt: UIButton!
}



class DiscoverGroupViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  {

    @IBOutlet weak var SearchGroupBar: UISearchBar!
    
    @IBOutlet var GroupTabl: UITableView!
    
    let arrImg: [UIImage] = [UIImage(named: "N1")!,
                             UIImage(named: "N2")!,
                             UIImage(named: "N3")!,
                             ]
    
    var arrTitle: [String] = ["L&T Group","Willow Hills Dental Care","Smile Everyday Group"]
    
    var Cell:GroupsCell2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GroupTabl.rowHeight = UITableViewAutomaticDimension
        GroupTabl.estimatedRowHeight = 130
        GroupTabl.tableFooterView = UIView()

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
        
        self.SearchGroupBar.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        SearchGroupBar?.resignFirstResponder()
        SearchGroupBar.text = ""
    }
    
    
    // MARK:  BackButtClicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
        let identifier = "GroupsCell2"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? GroupsCell2
        if Cell == nil
        {
            tableView.register(UINib(nibName: "GroupsCell2", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? GroupsCell2
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        GroupTabl.separatorStyle = .none
        GroupTabl.separatorColor = UIColor.clear
        
        Cell.GroupName.text = arrTitle[indexPath.row]
        Cell.GroupImg.image = arrImg[indexPath.row]
        
        Cell.JoinButt.layer.borderWidth = 1.0
        Cell.JoinButt.layer.borderColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
        
        return Cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "DiscussionViewController") as? DiscussionViewController
        myVC?.hidesBottomBarWhenPushed = true
        myVC?.StrJoinCheck = "1"
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
