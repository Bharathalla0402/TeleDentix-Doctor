//
//  AboutViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 03/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class MembersCell: UICollectionViewCell
{
    @IBOutlet var MemberImg: UIImageView!
}

class AboutViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var DiscussionSeg: UISegmentedControl!
    @IBOutlet var TitleLab: UILabel!
    @IBOutlet var AboutGroup: UILabel!
    @IBOutlet var MembersCollectionView: UICollectionView!
    
    var Cell:MembersCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         DiscussionSeg.selectedSegmentIndex = 1
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popToRootViewController(animated: true)
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
            self.navigationController?.popViewController(animated: false)
        }
        else if DiscussionSeg.selectedSegmentIndex == 1
        {
            DiscussionSeg.selectedSegmentIndex = 1
        }
    }
    
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
         return CGSize(width: 60 , height: 60)
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MembersCell", for: indexPath) as! MembersCell
        
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
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
