//
//  FinanceReportViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 05/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ReportUserCell: UITableViewCell
{
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserAge: UILabel!
    @IBOutlet var UserAddress: UILabel!
    @IBOutlet var SelectView: UIView!
}


class FinanceReportViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AMLineChartViewDataSource {

    @IBOutlet var lineChartView: AMLineChartView!
    @IBOutlet var UserTabl: UITableView!
    var Cell:ReportUserCell!
    
    @IBOutlet var CalenderButt: UIButton!
    @IBOutlet var Financesegment: UISegmentedControl!
    @IBOutlet var FinancialReport: UILabel!
    
    var lineDataList = [[CGFloat]]()
    var radarRowNum:Int = 0
    let radarAxisNum:UInt32 = 6
    var barColors = [UIColor]()
    var lineRowNum:Int = 4;
    
    let titles = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserTabl.rowHeight = UITableViewAutomaticDimension
        UserTabl.estimatedRowHeight = 130
        UserTabl.tableFooterView = UIView()
        
        prepareDataList()
        lineChartView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func SegChanged(_ sender: UISegmentedControl)
    {
        if Financesegment.selectedSegmentIndex == 0
        {
            Financesegment.selectedSegmentIndex = 0
            CalenderButt.isHidden = true
            FinancialReport.text = "You earned $19,750 in this week"
        }
        else if Financesegment.selectedSegmentIndex == 1
        {
            Financesegment.selectedSegmentIndex = 1
            CalenderButt.isHidden = false
            FinancialReport.text = "Half Year Revenue is $1,343,00"
        }
    }
    
    
    
    private func prepareDataList ()
    {
        let lineSectionNum = 1
        lineRowNum = 7
        print(lineRowNum)
        lineDataList.removeAll()
        for _ in 0..<lineSectionNum {
            
            var values = [CGFloat]()
            for _ in 0..<lineRowNum {
                
                let value = CGFloat(arc4random_uniform(4))
                values.append(value)
            }
            lineDataList.append(values)
        }
        
    }
    
    // MARK:  linechartView
    
    func numberOfSections(inLineChartView lineChartView:AMLineChartView) -> Int
    {
        return 1
    }
    
    func numberOfRows(inLineChartView:AMLineChartView) -> Int
    {
        return lineRowNum
    }
    
    func lineChartView(lineChartView:AMLineChartView, valueForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return lineDataList[indexPath.section][indexPath.row]
    }
    
    func lineChartView(lineChartView:AMLineChartView, colorForSection section: Int) -> UIColor {
        
        let r = CGFloat(255)/255.0
        let g = CGFloat(255)/255.0
        let b = CGFloat(255)/255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    func lineChartView(lineChartView:AMLineChartView, titleForXlabelInRow row: Int) -> String {
        
        return titles[row]
    }
    
    func lineChartView(lineChartView:AMLineChartView, pointTypeForSection section: Int) -> AMLCPointType {
        
        return AMLCPointType.type2
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
        let identifier = "ReportUserCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ReportUserCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "ReportUserCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ReportUserCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        UserTabl.separatorStyle = .none
        UserTabl.separatorColor = UIColor.clear
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
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
        headerLabel.text = "Unpaid Bills"
        
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
