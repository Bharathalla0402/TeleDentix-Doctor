//
//  AppointmentHistoryViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 28/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class AppointmentHisCell: UITableViewCell
{
    @IBOutlet weak var AppointHisDateLab: UILabel!
    @IBOutlet weak var CountSharedLab: UILabel!
    @IBOutlet weak var TimeLab: UILabel!
    
}

class AppointmentHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    
    @IBOutlet weak var AppointHisTabl: UITableView!
    
    var Cell:AppointmentHisCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppointHisTabl.rowHeight = UITableViewAutomaticDimension
        AppointHisTabl.estimatedRowHeight = 130
        AppointHisTabl.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  Back Butt Clicked
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
        let identifier = "AppointmentHisCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AppointmentHisCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "AppointmentHisCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AppointmentHisCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        AppointHisTabl.separatorStyle = .none
        AppointHisTabl.separatorColor = UIColor.clear
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "HistoryDetailsViewController") as? HistoryDetailsViewController
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
