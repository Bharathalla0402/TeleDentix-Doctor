//
//  ReviewReferalViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 27/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class SelectDoctorCell2: UITableViewCell
{
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserAddress: UILabel!
    @IBOutlet var SelectView: UIView!
}

class DoctorlistCell2: UICollectionViewCell
{
    @IBOutlet weak var DoctorView: UIView!
    @IBOutlet weak var DoctorImage: UIImageView!
    @IBOutlet weak var DoctorName: UILabel!
    @IBOutlet weak var CancelButt: UIButton!
}

class ReviewReferalViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var UserTabl: UITableView!
    @IBOutlet weak var PatientCountLab: UILabel!
    @IBOutlet weak var DoctorCollectionView: UICollectionView!
    
    @IBOutlet var NextButt: UIButton!
    var Cell:SelectDoctorCell2!
    
    var Cell2:DoctorlistCell2!
    var DoclistArray =  [String]()
    
    var popview2 =  UIView()
    var footerview2 =  UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserTabl.rowHeight = UITableViewAutomaticDimension
        UserTabl.estimatedRowHeight = 130
        UserTabl.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK:  BackButt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Notification Butt Clicked
    @IBAction func NotificationButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController
        myVC?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    // MARK:  TableView Delegate Methods
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = "SelectDoctorCell2"
        Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SelectDoctorCell2
        if Cell == nil
        {
            tableView.register(UINib(nibName: "SelectDoctorCell2", bundle: nil), forCellReuseIdentifier: identifier)
            Cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SelectDoctorCell2
        }
        Cell?.selectionStyle = UITableViewCellSelectionStyle.none
        UserTabl.separatorStyle = .none
        UserTabl.separatorColor = UIColor.clear
        
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 180 , height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "DoctorlistCell2", for: indexPath) as! DoctorlistCell2
        
        Cell2.DoctorView.layer.borderWidth = 1.0
        Cell2.DoctorView.layer.borderColor = #colorLiteral(red: 0.1445401311, green: 0.3383063674, blue: 0.8815893531, alpha: 1)
        
        Cell2.CancelButt.tag = indexPath.row
        Cell2.CancelButt.addTarget(self, action: #selector(self.CancelButtClicked), for: .touchUpInside)
        
        return Cell2
    }
    
    //MARK:Cancel Butt Clicked
    
    @IBAction func CancelButtClicked(_ sender: UIButton)
    {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    
    
    
    
    // MARK:  Previous Butt Clicked
    @IBAction func PreviousButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:  Next Butt Clicked
    @IBAction func NextButtClicked(_ sender: UIButton)
    {
        popUp()
    }
    
    
    // MARK:  popup
    func popUp()
    {
        popview2.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height)
        popview2.backgroundColor=UIColor(patternImage: UIImage(named: "BGM")!)
        self.view.addSubview(popview2)
        
        footerview2.frame = CGRect(x:self.view.frame.size.width/2-140, y:self.view.frame.size.height/2-87.5, width:280, height:175)
        footerview2.backgroundColor = UIColor.white
        footerview2.layer.cornerRadius = 8.0
        footerview2.clipsToBounds = true
        popview2.addSubview(footerview2)
        
        let Nalabel = UILabel(frame: CGRect(x: 0, y: 15, width: 280, height: 25))
        Nalabel.text = "You have successfully referred!"
        Nalabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        Nalabel.textColor = UIColor.black
        Nalabel.textAlignment = .center
        footerview2.addSubview(Nalabel)
        
        let Namelabel = UILabel(frame: CGRect(x: 10, y: 40, width: footerview2.frame.size.width - 20, height: 90))
        Namelabel.numberOfLines = 0
        Namelabel.textAlignment = .center
        let regularAttribute: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.black,
            .font : UIFont.systemFont(ofSize: 14)
        ]
        
        let regularAttribute2: [NSAttributedStringKey: Any] = [
            .foregroundColor : UIColor.black,
            .font : UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        
        let str1 = "Matt Morgan "
        let str2 = "and "
        let str3 = "Alex Pinn "
        let str4 = "to "
        let str5 = "Dr.Richard Lewis"
        let mutableAttributedString = NSMutableAttributedString()
        let regularAttributedString = NSAttributedString(string: str1, attributes: regularAttribute2)
        let boldAttributedString = NSAttributedString(string: str2, attributes: regularAttribute)
        let boldAttributedString2 = NSAttributedString(string: str3, attributes: regularAttribute2)
        let boldAttributedString3 = NSAttributedString(string: str4, attributes: regularAttribute)
        let boldAttributedString4 = NSAttributedString(string: str5, attributes: regularAttribute2)
        mutableAttributedString.append(regularAttributedString)
        mutableAttributedString.append(boldAttributedString)
        mutableAttributedString.append(boldAttributedString2)
        mutableAttributedString.append(boldAttributedString3)
        mutableAttributedString.append(boldAttributedString4)
        Namelabel.attributedText = mutableAttributedString
        footerview2.addSubview(Namelabel)
        
        let Nlabel = UILabel(frame: CGRect(x: 0, y: 130, width: 280, height: 1))
        Nlabel.backgroundColor = UIColor.lightGray
        footerview2.addSubview(Nlabel)
        
        
        let ContinueButton = UIButton(frame: CGRect(x: 0, y: 131, width: 280, height: 44))
        ContinueButton.backgroundColor = UIColor.white
        ContinueButton.layer.cornerRadius = 4
        ContinueButton.clipsToBounds = true
        ContinueButton.setTitle("Ok", for: .normal)
        ContinueButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        ContinueButton.contentHorizontalAlignment = .center
        ContinueButton.setTitleColor(UIColor.black, for: .normal)
        ContinueButton.addTarget(self, action: #selector(self.continueButtonClicked2(_:)), for: .touchUpInside)
        footerview2.addSubview(ContinueButton)
    }
    
    @IBAction func continueButtonClicked2(_ sender: Any)
    {
        footerview2.removeFromSuperview()
        popview2.removeFromSuperview()
        self.navigationController?.popToRootViewController(animated: true)
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
