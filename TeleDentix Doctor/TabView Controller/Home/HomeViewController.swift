//
//  HomeViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 19/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class SchedulelistCell: UITableViewCell
{
    @IBOutlet var timeLab: UILabel!
    @IBOutlet var CountLab: UILabel!
    @IBOutlet var CountVirtualWalk: UILabel!
}

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var ExaminationImg: UIImageView!
    @IBOutlet var AllClinicLab: UILabel!
    @IBOutlet var leftButt: UIButton!
    @IBOutlet var rightButt: UIButton!
    @IBOutlet var weekDayLab: UILabel!
    @IBOutlet var dateLab: UILabel!
    @IBOutlet var AppointmentsTabl: UITableView!
    @IBOutlet var ClinicButt: UIButton!
    @IBOutlet var SelectSeg: UISegmentedControl!
    
    @IBOutlet var MoreAddTabl: UITableView!
    var MoreAddArray: [String] = ["Appointment","Patient","Referral","Invitation","Group"]
    let arrImg: [UIImage] = [UIImage(named: "M1")!,
                             UIImage(named: "M2")!,
                             UIImage(named: "M3")!,
                             UIImage(named: "M4")!,
                             UIImage(named: "M5")!,
                             ]
    
    var arrDates = [String]()
    var arrMonth = [String]()
    var arrMonthname = [String]()
    var arrYear = [String]()
    var arrFinalDate = [String]()
    
    var index:Int = 0
    var Cell:SchedulelistCell!
    var Cell1:SchedulelistCell!
    var Cell2:MoreAddCell!
    
    var popview = MVPopView()
    var footerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExaminationImg.isHidden = true
        
        getLast7Dates()
        leftButt.isHidden = true
        weekDayLab.text = "Today's Appointments"
        dateLab.text = arrFinalDate[index]
        
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        
        SelectSeg.tintColor = #colorLiteral(red: 0, green: 0.3647058824, blue: 0.862745098, alpha: 1)
        
        let attributes: [NSAttributedStringKey: Any] = [
            .foregroundColor : #colorLiteral(red: 0, green: 0.3647058824, blue: 0.862745098, alpha: 1),
            .font : UIFont.systemFont(ofSize: 16)
        ]
        
        SelectSeg.setTitleTextAttributes(attributes, for: .normal)
        
        AppointmentsTabl.tag = 1
        
        popupview()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK:  list All Clinic Clicked
    @IBAction func listAllClinicClicked(_ sender: UIButton)
    {
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
        
        let pibraryAction = UIAlertAction(title: "All Clinics", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            self.AllClinicLab.text = "All Clinics"
        })
        
        let cameraction = UIAlertAction(title: "Virtual Dental Care", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            self.AllClinicLab.text = "Virtual Dental Care"
        })
        
        let cameraction2 = UIAlertAction(title: "Universal Dental Group", style: .default, handler:
        {(alert: UIAlertAction!) -> Void in
            self.AllClinicLab.text = "Universal Dental Group"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(pibraryAction)
        optionMenu.addAction(cameraction)
        optionMenu.addAction(cameraction2)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            let popOverPresentationController : UIPopoverPresentationController = optionMenu.popoverPresentationController!
            popOverPresentationController.sourceView                = ClinicButt
            popOverPresentationController.sourceRect                = ClinicButt.bounds
            popOverPresentationController.permittedArrowDirections  = UIPopoverArrowDirection.any
        }
    }
    
    // MARK:  Notification Butt Clicked
    @IBAction func NotificationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    // MARK:  Search Butt Clicked
    @IBAction func SearchButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: false)
    }
    
    // MARK:  list All Clinic Clicked
    @IBAction func PendingApprovalButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "PendingRequestViewController") as? PendingRequestViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    // MARK:  Left Date Butt Clicked
    @IBAction func LeftButtClicked(_ sender: UIButton)
    {
        if index == 0
        {
            leftButt.isHidden = true
            rightButt.isHidden = false
        }
        else
        {
            index = index - 1
            if index == 0
            {
                weekDayLab.text = "Today's Appointments"
                dateLab.text = arrFinalDate[index]
                leftButt.isHidden = true
                rightButt.isHidden = false
            }
            else if index == 1
            {
                weekDayLab.text = "Tomorrow's Appointments"
                dateLab.text = arrFinalDate[index]
                leftButt.isHidden = false
                rightButt.isHidden = false
            }
            else
            {
                weekDayLab.text = "Next's Appointments"
                dateLab.text = arrFinalDate[index]
                leftButt.isHidden = false
                rightButt.isHidden = false
            }
        }
    }
    
    // MARK:  Right Date Butt Clicked
    
    @IBAction func RightButtClicked(_ sender: UIButton)
    {
        if index == arrFinalDate.count-1
        {
            leftButt.isHidden = false
            rightButt.isHidden = true
        }
        else
        {
            index = index + 1
            if index == arrFinalDate.count-1
            {
                weekDayLab.text = "Next's Appointments"
                dateLab.text = arrFinalDate[index]
                leftButt.isHidden = false
                rightButt.isHidden = true
            }
            else if index == 1
            {
                weekDayLab.text = "Tomorrow's Appointments"
                dateLab.text = arrFinalDate[index]
                leftButt.isHidden = false
                rightButt.isHidden = false
            }
            else
            {
                weekDayLab.text = "Next's Appointments"
                dateLab.text = arrFinalDate[index]
                leftButt.isHidden = false
                rightButt.isHidden = false
            }
        }
    }
    
    func getLast7Dates()
    {
        arrFinalDate.removeAll()
        let cal = Calendar.current
        let date = cal.startOfDay(for: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        for i in 0 ... 14
        {
            let newdate = cal.date(byAdding: .day, value: i, to: date)!
            let str = dateFormatter.string(from: newdate)
            arrFinalDate.append(str)
        }
        print(arrFinalDate)
    }
    
    
    // MARK:  Seg Changed
    @IBAction func SegChanged(_ sender: UISegmentedControl)
    {
        if SelectSeg.selectedSegmentIndex == 0
        {
            SelectSeg.selectedSegmentIndex = 0
            AppointmentsTabl.tag = 1
            AppointmentsTabl.reloadData()
        }
        else if SelectSeg.selectedSegmentIndex == 1
        {
            SelectSeg.selectedSegmentIndex = 1
            AppointmentsTabl.tag = 2
            AppointmentsTabl.reloadData()
        }
    }
    
    
    // MARK:  TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView.tag == 3
        {
            return 60
        }
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 3
        {
            return MoreAddArray.count
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView.tag == 3
        {
            let identifier = "MoreAddCell"
            Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? MoreAddCell
            if Cell2 == nil
            {
                tableView.register(UINib(nibName: "MoreAddCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? MoreAddCell
            }
            Cell2?.selectionStyle = UITableViewCellSelectionStyle.none
            MoreAddTabl.separatorStyle = .none
            MoreAddTabl.separatorColor = UIColor.clear
            
            Cell2.MoreLab.text = MoreAddArray[indexPath.row]
            Cell2.MoreImg.image = arrImg[indexPath.row]
            
            Cell2.MoreButt.tag = indexPath.row
            Cell2.MoreButt.addTarget(self, action: #selector(self.MoreButtClicked), for: .touchUpInside)
            
            
            return Cell2!
        }
        else if tableView.tag == 2
        {
            let identifier = "SchedulelistCell"
            Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? SchedulelistCell
            if Cell1 == nil
            {
                tableView.register(UINib(nibName: "SchedulelistCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell1 = tableView.dequeueReusableCell(withIdentifier: identifier) as? SchedulelistCell
            }
            Cell1?.selectionStyle = UITableViewCellSelectionStyle.none
            AppointmentsTabl.separatorStyle = .none
            AppointmentsTabl.separatorColor = UIColor.clear
            
            Cell1.timeLab.text = "04:00 PM - 05:00 PM"
            Cell1.CountVirtualWalk.text = "2 Virtual\n1 Walk In"
            
            return Cell1!
        }
        else
        {
            let identifier = "SchedulelistCell"
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SchedulelistCell
            if Cell == nil
            {
                tableView.register(UINib(nibName: "SchedulelistCell", bundle: nil), forCellReuseIdentifier: identifier)
                Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SchedulelistCell
            }
            Cell?.selectionStyle = UITableViewCellSelectionStyle.none
            AppointmentsTabl.separatorStyle = .none
            AppointmentsTabl.separatorColor = UIColor.clear
            
            Cell.timeLab.text = "09:00 AM - 10:00 AM"
            Cell.CountVirtualWalk.text = "2 Virtual\n1 Walk In"
            
            return Cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.tag == 3
        {
            if indexPath.row == 0
            {
                self.tabBarController?.tabBar.isHidden = false
                //  popview.isHidden=true
                // footerView.isHidden=true
                // MoreAddTabl.removeFromSuperview()
                
                popview.dismiss()
                
                let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseAppointmentViewController") as? ChooseAppointmentViewController
                myVC?.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(myVC!, animated: true)
            }
            else if indexPath.row == 1
            {
                
            }
            else if indexPath.row == 2
            {
                
            }
            else if indexPath.row == 3
            {
                
            }
            else if indexPath.row == 4
            {
                
            }
        }
        else if tableView.tag == 2
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AppontmentsListViewController") as? AppontmentsListViewController
            myVC?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(myVC!, animated: true)
        }
        else
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AppontmentsListViewController") as? AppontmentsListViewController
            myVC?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(myVC!, animated: true)
        }
    }
    
    //MARK: Next Booking Appointment Clicked
    
    @IBAction func MoreButtClicked(_ sender: UIButton)
    {
        if sender.tag == 0
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseAppointmentViewController") as? ChooseAppointmentViewController
            myVC?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(myVC!, animated: true)
            
            self.tabBarController?.tabBar.isHidden = false
            popview.dismiss()
        }
        else if sender.tag == 1
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AddPatientViewController") as? AddPatientViewController
            myVC?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(myVC!, animated: true)
            
            self.tabBarController?.tabBar.isHidden = false
            popview.dismiss()
        }
        else if sender.tag == 2
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ReferalViewController") as? ReferalViewController
            myVC?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(myVC!, animated: true)
            
            self.tabBarController?.tabBar.isHidden = false
            popview.dismiss()
        }
        else if sender.tag == 3
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "InviteViewController") as? InviteViewController
            myVC?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(myVC!, animated: true)
            
            self.tabBarController?.tabBar.isHidden = false
            popview.dismiss()
        }
        else if sender.tag == 4
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateGroupViewController") as? CreateGroupViewController
            myVC?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(myVC!, animated: true)
            
            self.tabBarController?.tabBar.isHidden = false
            popview.dismiss()
        }
    }
    
    
    // MARK:  Plus Butt Clicked
    @IBAction func PlusButtClicked(_ sender: UIButton)
    {
        self.tabBarController?.tabBar.isHidden = true
        popview.show(in: self.view)
    }
    
    func popupview()
    {
        popview.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height)
        popview.backgroundColor=UIColor(patternImage: UIImage(named: "BGM")!)
        // self.view.addSubview(popview)
        // popview.animShow()
        
        footerView.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height)
        footerView.backgroundColor = UIColor.clear
        popview.addSubview(footerView)
        
        MoreAddTabl = UITableView()
        MoreAddTabl.frame = CGRect(x: 0, y: self.view.frame.size.height-360, width: self.view.frame.size.width, height: 360)
        MoreAddTabl.delegate = self
        MoreAddTabl.dataSource = self
        MoreAddTabl.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        MoreAddTabl.backgroundColor = UIColor.clear
        MoreAddTabl.tag = 3
        MoreAddTabl.backgroundColor = UIColor.white
        footerView.addSubview(MoreAddTabl)
        
        let ButtonView = UIView()
        ButtonView.frame = CGRect(x:0, y:self.view.frame.size.height-420, width:self.view.frame.size.width, height:60)
        ButtonView.backgroundColor = UIColor.white
        footerView.addSubview(ButtonView)
        
        let linelab = UILabel()
        linelab.frame = CGRect(x:0, y:59, width:ButtonView.frame.size.width, height:1)
        linelab.backgroundColor = UIColor.lightGray
        ButtonView.addSubview(linelab)
        
        let textlab = UILabel()
        textlab.frame = CGRect(x:10, y:15, width:150, height:30)
        textlab.text="Create"
        textlab.font =  UIFont(name:"Helvetica-medium", size: 16)
        textlab.textColor=UIColor.black
        textlab.textAlignment = .left
        ButtonView.addSubview(textlab)
        
        
        let submitbutt = UIButton()
        submitbutt.frame = CGRect(x:ButtonView.frame.size.width-120, y:15, width:110, height:30)
        submitbutt.setTitle("Cancel", for: .normal)
        submitbutt.setTitleColor(UIColor.blue, for:.normal)
        submitbutt.contentHorizontalAlignment = .right
        submitbutt.addTarget(self, action:#selector(self.CancelButtonAction(_:)), for: .touchUpInside)
        ButtonView.addSubview(submitbutt)
    }
    
    
    @objc func CancelButtonAction(_ sender: UIButton!)
    {
        // popview.animHide()
        self.tabBarController?.tabBar.isHidden = false
        // popview.isHidden=true
        //  footerView.isHidden=true
        // MoreAddTabl.removeFromSuperview()
        
        popview.dismiss()
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

extension UIView{
    func animShow(){
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear],
                       animations: {
                        // self.center.y += self.bounds.height
                        self.layoutIfNeeded()
                        
        },  completion: {(_ completed: Bool) -> Void in
            self.isHidden = true
        })
    }
}



