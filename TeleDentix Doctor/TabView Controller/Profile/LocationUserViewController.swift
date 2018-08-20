//
//  LocationUserViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 06/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class LocationUserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  About Location Clicked
    @IBAction func AboutLocationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AboutLocationViewController") as? AboutLocationViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
     // MARK:  Patient List Clicked
    @IBAction func PatientListButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ListPatientsViewController") as? ListPatientsViewController
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
