//
//  NotificationViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 20/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell
{
    @IBOutlet var NotificationView: UIView!
    @IBOutlet var NotificationImage: UIImageView!
    @IBOutlet var NotificationLab: UILabel!
    @IBOutlet var NotificationDate: UILabel!
}

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet var NotificationTabl: UITableView!
    var Cell:NotificationCell!
    
    let arrImg: [UIImage] = [UIImage(named: "N1")!,
                             UIImage(named: "N2")!,
                             UIImage(named: "N3")!,
                             ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationTabl.rowHeight = UITableViewAutomaticDimension
        NotificationTabl.estimatedRowHeight = 120
        NotificationTabl.tableFooterView = UIView()
    }
    
    // MARK:  BackButt Clicked
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
        let identifier = "NotificationCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? NotificationCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? NotificationCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        NotificationTabl.separatorStyle = .none
        NotificationTabl.separatorColor = UIColor.clear
        
        Cell.NotificationImage.image = arrImg[indexPath.row]
        
        let strokeTextAttributes: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.black,
            .font : UIFont.systemFont(ofSize: 15, weight: .semibold)
        ]
        
        let strokeTextAttributes2: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.darkGray,
            .font : UIFont.systemFont(ofSize: 15)
        ]
        
        let strokeTextAttributes3: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.blue,
            .font : UIFont.systemFont(ofSize: 14)
        ]
        
        let strokeTextAttributes4: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.blue,
            .font : UIFont.systemFont(ofSize: 14, weight: .semibold)
        ]
        
        if indexPath.row == 0
        {
            let strtext = "Robert dough"
            let strtext2 = " is ready for appointment.\nPlease start "
            let strtext3 = "Video Conferrencing"
            let strtext4 = " appointment. "
            
            let mutableAttributedString = NSMutableAttributedString()
            let regularAttributedString = NSAttributedString(string: strtext, attributes: strokeTextAttributes)
            let boldAttributedString = NSAttributedString(string: strtext2, attributes: strokeTextAttributes2)
            let boldAttributedString2 = NSAttributedString(string: strtext3, attributes: strokeTextAttributes)
            let boldAttributedString3 = NSAttributedString(string: strtext4, attributes: strokeTextAttributes2)
            mutableAttributedString.append(regularAttributedString)
            mutableAttributedString.append(boldAttributedString)
            mutableAttributedString.append(boldAttributedString2)
            mutableAttributedString.append(boldAttributedString3)
            Cell.NotificationLab.attributedText = mutableAttributedString
            
            let strtext5 = "Today at "
            let strtext6 = "03:05 PM"
            let mutableAttributedString2 = NSMutableAttributedString()
            let regularAttributedString2 = NSAttributedString(string: strtext5, attributes: strokeTextAttributes3)
            let boldAttributedString22 = NSAttributedString(string: strtext6, attributes: strokeTextAttributes4)
            mutableAttributedString2.append(regularAttributedString2)
            mutableAttributedString2.append(boldAttributedString22)
            Cell.NotificationDate.attributedText = mutableAttributedString2
        }
        else if indexPath.row == 1
        {
            let strtext = "You have a meeting with"
            let strtext2 = " Dr.Scott Hacking "
            let strtext3 = "For"
            let strtext4 = " Friday, 27th Nov, 2017"
            let strtext5 = " at "
            let strtext6 = "11:00 AM"
            let strtext7 = "Dental Xchange,LA,USA   "
            
            let mutableAttributedString = NSMutableAttributedString()
            let regularAttributedString = NSAttributedString(string: strtext, attributes: strokeTextAttributes2)
            let boldAttributedString = NSAttributedString(string: strtext2, attributes: strokeTextAttributes)
            let boldAttributedString2 = NSAttributedString(string: strtext3, attributes: strokeTextAttributes2)
            let boldAttributedString3 = NSAttributedString(string: strtext4, attributes: strokeTextAttributes)
            let boldAttributedString4 = NSAttributedString(string: strtext5, attributes: strokeTextAttributes2)
            let boldAttributedString5 = NSAttributedString(string: strtext6, attributes: strokeTextAttributes)
            let boldAttributedString6 = NSAttributedString(string: strtext5, attributes: strokeTextAttributes2)
            let boldAttributedString7 = NSAttributedString(string: strtext7, attributes: strokeTextAttributes2)
            mutableAttributedString.append(regularAttributedString)
            mutableAttributedString.append(boldAttributedString)
            mutableAttributedString.append(boldAttributedString2)
            mutableAttributedString.append(boldAttributedString3)
            mutableAttributedString.append(boldAttributedString4)
            mutableAttributedString.append(boldAttributedString5)
            mutableAttributedString.append(boldAttributedString6)
            mutableAttributedString.append(boldAttributedString7)
            Cell.NotificationLab.attributedText = mutableAttributedString
            
            let strtext8 = "2 days ago at "
            let strtext9 = "03:05 PM,02/02/2018"
            let mutableAttributedString2 = NSMutableAttributedString()
            let regularAttributedString2 = NSAttributedString(string: strtext8, attributes: strokeTextAttributes3)
            let boldAttributedString22 = NSAttributedString(string: strtext9, attributes: strokeTextAttributes4)
            mutableAttributedString2.append(regularAttributedString2)
            mutableAttributedString2.append(boldAttributedString22)
            Cell.NotificationDate.attributedText = mutableAttributedString2
        }
        else
        {
            let strtext = "Dr. Amadeo Rivera"
            let strtext2 = " Commented in "
            let strtext3 = "Teledentix"
            let strtext4 = " group "
            
            let mutableAttributedString = NSMutableAttributedString()
            let regularAttributedString = NSAttributedString(string: strtext, attributes: strokeTextAttributes)
            let boldAttributedString = NSAttributedString(string: strtext2, attributes: strokeTextAttributes2)
            let boldAttributedString2 = NSAttributedString(string: strtext3, attributes: strokeTextAttributes)
            let boldAttributedString3 = NSAttributedString(string: strtext4, attributes: strokeTextAttributes2)
            mutableAttributedString.append(regularAttributedString)
            mutableAttributedString.append(boldAttributedString)
            mutableAttributedString.append(boldAttributedString2)
            mutableAttributedString.append(boldAttributedString3)
            Cell.NotificationLab.attributedText = mutableAttributedString
            
            let strtext8 = "2 days ago at "
            let strtext9 = "03:05 PM,02/02/2018"
            let mutableAttributedString2 = NSMutableAttributedString()
            let regularAttributedString2 = NSAttributedString(string: strtext8, attributes: strokeTextAttributes3)
            let boldAttributedString22 = NSAttributedString(string: strtext9, attributes: strokeTextAttributes4)
            mutableAttributedString2.append(regularAttributedString2)
            mutableAttributedString2.append(boldAttributedString22)
            Cell.NotificationDate.attributedText = mutableAttributedString2
        }
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
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
