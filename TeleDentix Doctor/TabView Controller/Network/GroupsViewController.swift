//
//  GroupsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 02/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class GroupsCell: UITableViewCell
{
    @IBOutlet var GroupImg: UIImageView!
    @IBOutlet var GroupName: UILabel!
    @IBOutlet var GroupMembers: UILabel!
    @IBOutlet var GroupUnreadMessageCount: UILabel!
}


class GroupsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var GroupSegment: UISegmentedControl!
    @IBOutlet var GroupTabl: UITableView!
    
    var Cell:GroupsCell!
    var Cell1:GroupsCell!
    
    let arrImg: [UIImage] = [UIImage(named: "N1")!,
                             UIImage(named: "N2")!,
                             UIImage(named: "N3")!,
                             ]
    
    var arrTitle: [String] = ["L&T Group","Willow Hills Dental Care","Smile Everyday Group"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GroupTabl.rowHeight = UITableViewAutomaticDimension
        GroupTabl.estimatedRowHeight = 130
        GroupTabl.tableFooterView = UIView()
        GroupTabl.tag = 1

        // Do any additional setup after loading the view.
    }
    
     // MARK:  BackButtClicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  PlusButtClicked
    @IBAction func PlusButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateGroupViewController") as? CreateGroupViewController
        myVC?.hidesBottomBarWhenPushed = true
        myVC?.strCheckCondition = "1"
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Segment Changed
    @IBAction func SegmentChanged(_ sender: UISegmentedControl)
    {
        if GroupSegment.selectedSegmentIndex == 0
        {
            GroupSegment.selectedSegmentIndex = 0
            GroupTabl.tag = 1
            GroupTabl.reloadData()
        }
        else if GroupSegment.selectedSegmentIndex == 1
        {
            GroupSegment.selectedSegmentIndex = 1
            GroupTabl.tag = 2
            GroupTabl.reloadData()
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
            let identifier = "GroupsCell"
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? GroupsCell
            if Cell == nil
            {
                tableView.register(UINib(nibName: "GroupsCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? GroupsCell
            }
            Cell?.selectionStyle = UITableViewCellSelectionStyle.none
            GroupTabl.separatorStyle = .none
            GroupTabl.separatorColor = UIColor.clear
            
            Cell.GroupName.text = arrTitle[indexPath.row]
            Cell.GroupImg.image = arrImg[indexPath.row]
            
            if indexPath.row == 0
            {
                Cell.GroupUnreadMessageCount.isHidden = false
            }
            else
            {
                Cell.GroupUnreadMessageCount.isHidden = true
            }
            
            return Cell!
        }
        else 
        {
            let identifier = "GroupsCell"
            Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? GroupsCell
            if Cell1 == nil
            {
                tableView.register(UINib(nibName: "GroupsCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? GroupsCell
            }
            Cell1?.selectionStyle = UITableViewCellSelectionStyle.none
            GroupTabl.separatorStyle = .none
            GroupTabl.separatorColor = UIColor.clear
            
            Cell1.GroupUnreadMessageCount.isHidden = true
            
            return Cell1!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "DiscussionViewController") as? DiscussionViewController
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
