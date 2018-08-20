//
//  AddMoreViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 20/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class AddMoreViewController: UIViewController {

    @IBOutlet var BackgroundView: UIView!
    @IBOutlet var MoreListTabl: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         BackgroundView.backgroundColor=UIColor(patternImage: UIImage(named: "BGM")!)
        
          self.view.backgroundColor=UIColor(patternImage: UIImage(named: "BGM")!)

        // Do any additional setup after loading the view.
    }

    @IBAction func CancelButtClicked(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
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
