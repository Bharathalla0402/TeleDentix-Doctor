//
//  NotificationSettingsViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 08/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class NotificationSettingsViewController: UIViewController {

    @IBOutlet var ResetButt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResetButt.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        ResetButt.layer.borderWidth = 1.0
        ResetButt.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
     // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
      self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Reset Butt Clicked
    @IBAction func ResetButtClicked(_ sender: UIButton)
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
