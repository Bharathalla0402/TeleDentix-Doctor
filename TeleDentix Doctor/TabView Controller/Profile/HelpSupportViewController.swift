//
//  HelpSupportViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 09/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell
{
    @IBOutlet var QuestionLab: UILabel!
    @IBOutlet var AnswerLab: UILabel!
    
}

class HelpSupportViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet var NewYorkView: UIView!
    @IBOutlet var CaliforniaView: UIView!
    @IBOutlet var QuestionTabl: UITableView!
    
    var Cell:QuestionCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewYorkView.layer.borderWidth = 1.5
        NewYorkView.clipsToBounds = true
        NewYorkView.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        NewYorkView.layer.cornerRadius = 4.0
        
        CaliforniaView.layer.borderWidth = 1.5
        CaliforniaView.clipsToBounds = true
        CaliforniaView.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        CaliforniaView.layer.cornerRadius = 4.0
        
        QuestionTabl.rowHeight = UITableViewAutomaticDimension
        QuestionTabl.estimatedRowHeight = 130
        QuestionTabl.tableFooterView = UIView()
        
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
        let identifier = "QuestionCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? QuestionCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? QuestionCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        QuestionTabl.separatorStyle = .none
        QuestionTabl.separatorColor = UIColor.clear
        
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
