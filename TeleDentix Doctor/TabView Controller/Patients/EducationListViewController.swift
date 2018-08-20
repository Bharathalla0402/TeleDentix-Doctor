//
//  EducationListViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 30/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class PrescriptionListCell2: UITableViewCell
{
    @IBOutlet weak var PrescriptionName: UILabel!
    @IBOutlet weak var PrescriptionDate: UILabel!
}

class EducationListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var PresciptionTabl: UITableView!
    var Cell:PrescriptionListCell2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PresciptionTabl.rowHeight = UITableViewAutomaticDimension
        PresciptionTabl.estimatedRowHeight = 130
        PresciptionTabl.tableFooterView = UIView()
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = "PrescriptionListCell2"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PrescriptionListCell2
        if Cell == nil
        {
            tableView.register(UINib(nibName: "PrescriptionListCell2", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PrescriptionListCell2
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        PresciptionTabl.separatorStyle = .none
        PresciptionTabl.separatorColor = UIColor.clear
        
        if indexPath.row == 0
        {
            Cell.PrescriptionDate.text = "18th Oct, 2017"
        }
        else
        {
            Cell.PrescriptionDate.text = "17th Aug, 2017"
        }
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "EducationDetailViewController") as? EducationDetailViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Share Butt Clicked
    @IBAction func ShareButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ShareEducationViewController") as? ShareEducationViewController
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
