//
//  ListPatientsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 06/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ListPatientCell: UITableViewCell
{
    @IBOutlet weak var PatientImage: UIImageView!
    @IBOutlet weak var PatientName: UILabel!
    @IBOutlet weak var PatientAge: UILabel!
    @IBOutlet weak var PatientAddress: UILabel!
}

class ListPatientsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var PatientTabl: UITableView!
    @IBOutlet var PatientSearchBar: UISearchBar!
    
    let arrImg: [UIImage] = [UIImage(named: "UserDummy")!,
                             UIImage(named: "UserDummy2")!,
                             UIImage(named: "UserDummy3")!,
                             ]
    
    var arrTitle: [String] = ["Matt Morgon","Alex Pinn","Jeff Robinson"]
    var arrTitle2: [String] = ["Jeff Robinson","Alex Pinn","Matt Morgon"]
    
    var Cell:ListPatientCell!

    override func viewDidLoad() {
        super.viewDidLoad()

        PatientSearchBar.delegate = self
        
        PatientTabl.rowHeight = UITableViewAutomaticDimension
        PatientTabl.estimatedRowHeight = 130
        PatientTabl.tableFooterView = UIView()
        
         self.addDoneButtonOnKeyboard()
        // Do any additional setup after loading the view.
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.PatientSearchBar.inputAccessoryView = doneToolbar
    }
    
    
    @objc func doneButtonAction()
    {
        PatientSearchBar?.resignFirstResponder()
        PatientSearchBar.text = ""
    }
    
      // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:  Searchbar Delegate Methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
    {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        PatientSearchBar?.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
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
        let identifier = "ListPatientCell"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ListPatientCell
        if Cell == nil
        {
            tableView.register(UINib(nibName: "ListPatientCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ListPatientCell
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        PatientTabl.separatorStyle = .none
        PatientTabl.separatorColor = UIColor.clear
        
        Cell.PatientName.text = arrTitle[indexPath.row]
        Cell.PatientImage.image = arrImg[indexPath.row]
        Cell.PatientAddress.textColor = #colorLiteral(red: 0.6077815294, green: 0.607886374, blue: 0.6077676415, alpha: 1)
        
        Cell.PatientAddress.text = "California, USA"
        
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
