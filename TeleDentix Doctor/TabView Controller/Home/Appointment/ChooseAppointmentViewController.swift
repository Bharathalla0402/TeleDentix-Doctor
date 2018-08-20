//
//  ChooseAppointmentViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 23/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ChooseAppointmentViewController: UIViewController {
    
    @IBOutlet var VirtualView: UIView!
    @IBOutlet var WalkInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Virtual Butt Clicked
    @IBAction func VirtualButtClicked(_ sender: UIButton)
    {
        VirtualView.backgroundColor = #colorLiteral(red: 0.368627451, green: 0.368627451, blue: 0.368627451, alpha: 1)
        WalkInView.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
        
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AppointPatientTypeViewController") as? AppointPatientTypeViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Walk In Butt Clicked
    @IBAction func WalkInButtClicked(_ sender: UIButton)
    {
        WalkInView.backgroundColor = #colorLiteral(red: 0.368627451, green: 0.368627451, blue: 0.368627451, alpha: 1)
        VirtualView.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.7490196078, blue: 0.4784313725, alpha: 1)
        
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
