//
//  AppontmentsListViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 20/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class AppontmentsListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var ReqTabl: UITableView!
    var Cell:PendingReqCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReqTabl.rowHeight = UITableViewAutomaticDimension
        ReqTabl.estimatedRowHeight = 130
        ReqTabl.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = "PendingReqCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PendingReqCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "PendingReqCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PendingReqCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        ReqTabl.separatorStyle = .none
        ReqTabl.separatorColor = UIColor.clear
        
        return Cell!
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
            headerLabel.text = "09:00 AM - 10:00 AM"
        }
        else
        {
            headerLabel.text = "10:00 AM - 11:00 AM"
        }
        
        // headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    
    
    // MARK:  Add Appointment Clicked
    @IBAction func AddAppointmentButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AppointPatientTypeViewController") as? AppointPatientTypeViewController
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
