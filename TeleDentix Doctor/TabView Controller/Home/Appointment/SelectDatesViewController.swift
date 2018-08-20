//
//  SelectDatesViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 26/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell
{
    @IBOutlet var WeekNameLab: UILabel!
    @IBOutlet var WeekDateLab: UILabel!
}

class TimeDurationCell: UICollectionViewCell
{
    @IBOutlet var TimeDurLab: UILabel!
}

class TimeDurationCell2: UICollectionViewCell
{
    @IBOutlet var TimeDurLab: UILabel!
}


class SelectDatesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
  
    @IBOutlet var DateCollectionView: UICollectionView!
    @IBOutlet var TimeCollectionView: UICollectionView!
    @IBOutlet var DurationCollectionView: UICollectionView!
    
    var WeekDayArray = [String]()
    var DateArray = [String]()
    var TimeArray: [String] = ["09:00 AM","09:30 AM","10:00 AM","10:30 AM","11:00 AM","11:30 AM","12:00 PM"]
    var DurationArray: [String] = ["15 Mins","30 Mins","45 Mins","1 Hour"]
    
    @IBOutlet weak var TimeConstarins: NSLayoutConstraint!
    @IBOutlet weak var DutationConstrains: NSLayoutConstraint!
    
    var Cell:DateCell!
    var Cell2:TimeDurationCell!
    var Cell3:TimeDurationCell2!
    
    var StrWeekDay = String()
    var StrTime = String()
    var StrDuration = String()
    
    var popview2 =  UIView()
    var footerview2 =  UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TimeConstarins.constant = 150
        DutationConstrains.constant = 120
        
        getLast7Dates()
    }
    
    // MARK:  Get Next 15 Days
    
    func getLast7Dates()
    {
        DateArray.removeAll()
        WeekDayArray.removeAll()
        let cal = Calendar.current
        let date = cal.startOfDay(for: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "E"

        for i in 0 ... 14
        {
            let newdate = cal.date(byAdding: .day, value: i, to: date)!
            let str = dateFormatter.string(from: newdate)
            DateArray.append(str)
            
            let str2 = dateFormatter2.string(from: newdate)
            let strchar:String = String(str2.prefix(1))
            WeekDayArray.append(strchar)
        }
        print(WeekDayArray)
        print(DateArray)
    }
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == DateCollectionView
        {
            return self.DateArray.count
        }
        else if collectionView == TimeCollectionView
        {
            return self.TimeArray.count
        }
        else
        {
            return self.DurationArray.count
        }
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == DateCollectionView
        {
            return CGSize(width: self.view.bounds.size.width/7-(40/7) , height: 90)
        }
        else if collectionView == TimeCollectionView
        {
            if ( UIDevice.current.model.range(of: "iPad") != nil)
            {
                 return CGSize(width: self.view.bounds.size.width/5-6 , height: 40)
            }
            else
            {
               return CGSize(width: self.view.bounds.size.width/3-(20/3) , height: 40)
            }
        }
        else
        {
            if ( UIDevice.current.model.range(of: "iPad") != nil)
            {
                return CGSize(width: self.view.bounds.size.width/5-6 , height: 40)
            }
            else
            {
                return CGSize(width: self.view.bounds.size.width/3-(20/3) , height: 40)
            }
        }
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == DateCollectionView
        {
            Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as! DateCell
            Cell.WeekNameLab.text = WeekDayArray[indexPath.row]
            Cell.WeekDateLab.text = DateArray[indexPath.row]
            
            let str = DateArray[indexPath.row]
            if str == StrWeekDay
            {
                Cell.WeekDateLab.backgroundColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
                Cell.WeekDateLab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else
            {
                Cell.WeekDateLab.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                Cell.WeekDateLab.textColor = UIColor.black
            }
            return Cell
        }
        else if collectionView == TimeCollectionView
        {
            Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeDurationCell", for: indexPath) as! TimeDurationCell
            Cell2.TimeDurLab.text = TimeArray[indexPath.row]
            
            let str = TimeArray[indexPath.row]
            if str == StrTime
            {
                Cell2.contentView.backgroundColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
                Cell2.TimeDurLab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell2.contentView.layer.borderWidth = 1.0
                Cell2.contentView.layer.backgroundColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
            }
            else
            {
                Cell2.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell2.TimeDurLab.textColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
                Cell2.contentView.layer.borderWidth = 1.0
                Cell2.contentView.layer.borderColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
            }
            
            return Cell2
        }
        else
        {
            Cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeDurationCell2", for: indexPath) as! TimeDurationCell2
            Cell3.TimeDurLab.text = DurationArray[indexPath.row]
            
            let str = DurationArray[indexPath.row]
            if str == StrDuration
            {
                Cell3.contentView.backgroundColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
                Cell3.TimeDurLab.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell3.contentView.layer.borderWidth = 1.0
                Cell3.contentView.layer.backgroundColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
            }
            else
            {
                Cell3.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                Cell3.TimeDurLab.textColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
                Cell3.contentView.layer.borderWidth = 1.0
                Cell3.contentView.layer.borderColor = #colorLiteral(red: 0.1342690885, green: 0.3194370866, blue: 0.8288016915, alpha: 1)
            }
            
            return Cell3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == DateCollectionView
        {
           StrWeekDay = DateArray[indexPath.row]
            DateCollectionView.reloadData()
        }
        else if collectionView == TimeCollectionView
        {
            StrTime = TimeArray[indexPath.row]
            TimeCollectionView.reloadData()
        }
        else
        {
            StrDuration = DurationArray[indexPath.row]
            DurationCollectionView.reloadData()
        }
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
        Nalabel.text = "Your Booking is successfully done!"
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
        
        let str1 = "Patient "
        let str2 = "Serena Dough "
        let str3 = "with "
        let str4 = "Dr.Scott Hacking "
        let str5 = "on 03 march, 2018 at 11:30 AM"
        let mutableAttributedString = NSMutableAttributedString()
        let regularAttributedString = NSAttributedString(string: str1, attributes: regularAttribute)
        let boldAttributedString = NSAttributedString(string: str2, attributes: regularAttribute2)
        let boldAttributedString2 = NSAttributedString(string: str3, attributes: regularAttribute)
        let boldAttributedString3 = NSAttributedString(string: str4, attributes: regularAttribute2)
        let boldAttributedString4 = NSAttributedString(string: str5, attributes: regularAttribute)
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
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as? TabbarController
        myVC?.selectedIndex = 2
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
