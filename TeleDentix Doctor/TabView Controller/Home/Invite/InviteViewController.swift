//
//  InviteViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 27/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK:  BackButt Clicked
    @IBAction func InviteFacebookButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Google Plus Clicked
    @IBAction func GooglePlusButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Via Mail Clicked
    @IBAction func ViaMailButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Whats Up Clicked
    @IBAction func WhatsupButtClicked(_ sender: UIButton)
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
