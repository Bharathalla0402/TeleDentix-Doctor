//
//  MedicalRecordsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 30/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class MedicalRecordsCell: UITableViewCell
{
    @IBOutlet var RecordName: UILabel!
    @IBOutlet var RecordDate: UILabel!
}

class MedicalRecordsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var MedicalRecordTabl: UITableView!
    
    var Cell:MedicalRecordsCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicalRecordTabl.rowHeight = UITableViewAutomaticDimension
        MedicalRecordTabl.estimatedRowHeight = 130
        MedicalRecordTabl.tableFooterView = UIView()
        
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
        let identifier = "MedicalRecordsCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicalRecordsCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "MedicalRecordsCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicalRecordsCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        MedicalRecordTabl.separatorStyle = .none
        MedicalRecordTabl.separatorColor = UIColor.clear
        
        if indexPath.row == 0
        {
            Cell.RecordName.text = "Tooth Sensitivity"
            Cell.RecordDate.text = "18th Oct, 2017"
        }
        else
        {
            Cell.RecordName.text = "Gum Disease"
            Cell.RecordDate.text = "12th Aug, 2017"
        }
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var strname = String()
        if indexPath.row == 0
        {
            strname = "Tooth Sensitivity"
        }
        else
        {
            strname = "Gum Disease"
        }
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "RecordDetailsViewController") as? RecordDetailsViewController
        myVC?.hidesBottomBarWhenPushed = true
        myVC?.StrName = strname
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    // MARK:  Add Medical Record Butt Clicked
    @IBAction func AddMedicalRecordButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AddMedicalRecordViewController") as? AddMedicalRecordViewController
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
