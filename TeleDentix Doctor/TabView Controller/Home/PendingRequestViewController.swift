//
//  PendingRequestViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 20/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class PendingReqCell: UITableViewCell
{
    @IBOutlet var UserImg: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var BookingType: UILabel!
    @IBOutlet var DentalName: UILabel!
    @IBOutlet var BookingTime: UILabel!
    
}

class PendingRequestViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var ReqTabl: UITableView!
    var Cell:PendingReqCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ReqTabl.rowHeight = UITableViewAutomaticDimension
        ReqTabl.estimatedRowHeight = 130
        ReqTabl.tableFooterView = UIView()
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AppointmentDetailViewController") as? AppointmentDetailViewController
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
            headerLabel.text = "3rd Aug, 2018"
        }
        else
        {
            headerLabel.text = "4th Aug, 2018"
        }
        
        // headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: Cell.frame.size.height))
        backView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let backView2 = UIView(frame: CGRect(x: 0, y: 8, width: 80, height: Cell.frame.size.height-16))
        backView2.backgroundColor = #colorLiteral(red: 0.933103919, green: 0.08461549133, blue: 0.0839477703, alpha: 1)
        backView.addSubview(backView2)
        
        let myImage = UIImageView(frame: CGRect(x: backView2.frame.size.width/2-10, y: backView2.frame.size.height/2-10, width: 20, height: 20))
        myImage.image = UIImage(named: "DeleteI")
        myImage.contentMode = .scaleAspectFit
        backView2.addSubview(myImage)
        
        //        let label = UILabel(frame: CGRect(x: 0, y: myImage.frame.origin.y+16, width: backView.frame.size.width, height: 25))
        //        label.text = "Delete"
        //        label.textAlignment = .center
        //        label.textColor = UIColor.white
        //        label.font = UIFont(name: label.font.fontName, size: 15)
        //        backView.addSubview(label)
        
        let imgSize: CGSize = tableView.frame.size
        UIGraphicsBeginImageContextWithOptions(imgSize, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        backView.layer.render(in: context!)
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let delete = UITableViewRowAction(style: .destructive, title: "           ") { (action, indexPath) in
            
            //            self.strfoodbankid=(self.listArrayFoodBank.object(at: indexPath.row) as! NSDictionary).object(forKey: "id") as! String as NSString
            //
            //            let alert = UIAlertController(title: "Food Bank", message: "Are You Sure Want to Delete Food Bank.", preferredStyle: UIAlertControllerStyle.alert)
            //
            //            let alertOKAction=UIAlertAction(title:"Delete", style: UIAlertActionStyle.default,handler: { action in
            //                self.deletemethod()
            //            })
            //
            //            let alertCancelAction=UIAlertAction(title:"Cancel", style: UIAlertActionStyle.destructive,handler: { action in
            //
            //            })
            //
            //            alert.addAction(alertOKAction)
            //            alert.addAction(alertCancelAction)
            //
            //            self.present(alert, animated: true, completion: nil)
        }
        
        delete.backgroundColor = UIColor(patternImage: newImage)
        
        
        return [delete]
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
