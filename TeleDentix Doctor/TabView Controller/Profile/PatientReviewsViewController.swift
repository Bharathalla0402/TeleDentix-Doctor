//
//  PatientReviewsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 06/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
import AARatingBar

class PatientReviewCell:UITableViewCell
{
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserAddress: UILabel!
    @IBOutlet var MembersList: UILabel!
    @IBOutlet var RatingValue: AARatingBar!
    @IBOutlet var ReportButt: UIButton!
    
}

class PatientReviewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var UserTabl: UITableView!
    var Cell:PatientReviewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserTabl.rowHeight = UITableViewAutomaticDimension
        UserTabl.estimatedRowHeight = 130
        UserTabl.tableFooterView = UIView()

        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  Back Butt Methods
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
        let identifier = "PatientReviewCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientReviewCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "PatientReviewCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PatientReviewCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        UserTabl.separatorStyle = .none
        UserTabl.separatorColor = UIColor.clear
        
        Cell.ReportButt.layer.borderWidth = 1.0
        Cell.ReportButt.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.1568627451, blue: 0.2392156863, alpha: 1)
        
        Cell.ReportButt.tag = indexPath.row
        Cell.ReportButt.addTarget(self, action: #selector(self.ReportButtClicked), for: .touchUpInside)
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
    }
    
    //MARK: Next Booking Appointment Clicked
    
    @IBAction func ReportButtClicked(_ sender: UIButton)
    {
        let alert = UIAlertController(title: "Report", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry..", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let alertCancelAction=UIAlertAction(title:"Submit", style: UIAlertActionStyle.destructive,handler: { action in
            
        })
        
        
        alert.addAction(alertCancelAction)
        
        self.present(alert, animated: true, completion: nil)
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
