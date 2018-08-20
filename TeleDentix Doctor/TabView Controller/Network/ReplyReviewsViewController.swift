//
//  ReplyReviewsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 10/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ReviewsCell: UITableViewCell
{
    @IBOutlet var LeftConstrainConstant: NSLayoutConstraint!
    @IBOutlet var UserImg: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var DateTimeLab: UILabel!
    @IBOutlet var txtComment: UILabel!
    @IBOutlet var ReplyButt: UIButton!
    
}


class ReplyReviewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var txtComment: UITextField!
    @IBOutlet var ReplyTabl: UITableView!
    
     var Cell:ReviewsCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReplyTabl.rowHeight = UITableViewAutomaticDimension
        ReplyTabl.estimatedRowHeight = 130
        ReplyTabl.tableFooterView = UIView()
        
        
        txtComment.layer.borderWidth = 1.5
        txtComment.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = "ReviewsCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ReviewsCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "ReviewsCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ReviewsCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        ReplyTabl.separatorStyle = .none
        ReplyTabl.separatorColor = UIColor.clear
        
        if indexPath.row == 0
        {
            Cell.ReplyButt.isHidden = true
            Cell.LeftConstrainConstant.constant = 10
        }
        else if indexPath.row == 1
        {
            Cell.ReplyButt.isHidden = false
            Cell.LeftConstrainConstant.constant = 10
        }
        else
        {
            Cell.ReplyButt.isHidden = false
            Cell.LeftConstrainConstant.constant = 40
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
