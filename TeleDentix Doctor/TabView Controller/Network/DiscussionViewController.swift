//
//  DiscussionViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 03/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class DiscussionCell: UITableViewCell
{
    @IBOutlet var TypeNameLab: UILabel!
    @IBOutlet var ReferedBy: UILabel!
    @IBOutlet var DateLab: UILabel!
    @IBOutlet var PrescriptionImage: UIImageView!
    @IBOutlet var LikesLab: UILabel!
    @IBOutlet var ViewsLab: UILabel!
    @IBOutlet var CommentsLab: UILabel!
    @IBOutlet var DescribtionLab: UILabel!
    @IBOutlet var CommentView: UIView!
    
}


class DiscussionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var DiscussionTabl: UITableView!
    @IBOutlet var DiscussionSeg: UISegmentedControl!
    @IBOutlet var TitleLab: UILabel!
    @IBOutlet weak var JoinGroupButt: UIButton!
    @IBOutlet weak var JoinButtHeight: NSLayoutConstraint!
    
    var Cell:DiscussionCell!
    
    var StrJoinCheck = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DiscussionTabl.rowHeight = UITableViewAutomaticDimension
        DiscussionTabl.estimatedRowHeight = 200
        DiscussionTabl.tableFooterView = UIView()
        
        if StrJoinCheck == "1"
        {
           
        }
        else
        {
            JoinButtHeight.constant = 0
            JoinGroupButt.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DiscussionSeg.selectedSegmentIndex = 0
    }
    
    @IBAction func JoinButtClicked(_ sender: UIButton)
    {
      self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Plus Butt Clicked
    @IBAction func PlusButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateDiscussionViewController") as? CreateDiscussionViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
     // MARK:  Discussion Seg Changed
    @IBAction func DiscussionSegChanged(_ sender: UISegmentedControl)
    {
        if DiscussionSeg.selectedSegmentIndex == 0
        {
            DiscussionSeg.selectedSegmentIndex = 0
        }
        else if DiscussionSeg.selectedSegmentIndex == 1
        {
            DiscussionSeg.selectedSegmentIndex = 1
            
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as? AboutViewController
            self.navigationController?.pushViewController(myVC!, animated: false)
        }
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
        let identifier = "DiscussionCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DiscussionCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "DiscussionCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DiscussionCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        DiscussionTabl.separatorStyle = .none
        DiscussionTabl.separatorColor = UIColor.clear
        
        Cell.CommentView.layer.borderWidth = 1.0
        Cell.CommentView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ReplyReviewsViewController") as? ReplyReviewsViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
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
        headerLabel.font = UIFont.boldSystemFont(ofSize: 15)
        headerLabel.textAlignment = .center
        headerLabel.textColor = UIColor.black
        headerLabel.text = "Recent Discussions"
        
        // headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
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
