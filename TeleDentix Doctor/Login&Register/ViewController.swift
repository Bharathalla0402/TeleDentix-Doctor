//
//  ViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 18/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
import SCPageControl

class ViewController: UIViewController,UIScrollViewDelegate
{
    var screenWidth : CGFloat = UIScreen.main.bounds.size.width
    var screenHeight : CGFloat = UIScreen.main.bounds.size.height
    let arr_color: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.purple, UIColor.brown]
    
    var scrollViewObj = UIScrollView()
    let sc = SCPageControlView()
    let arrImg: [UIImage] = [UIImage(named: "Banner_01")!,
                             UIImage(named: "Banner_02")!,
                             UIImage(named: "Banner_03")!,
                             ]
    
    var arrTitle: [String] = ["Assist Patient\nAnytime Anywhere","Manage\nAppointments","Manage Groups,\nNetworks And More"]
    
    var arrDescription: [String] = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Lorem Ipsum is simply dummy text of the printing and typesetting industry."]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sc.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-50, width: UIScreen.main.bounds.size.width, height: 50)
        sc.scp_style = .SCJAFillCircle
        sc.set_view(3, current: 0, tint_color: UIColor(red: 36/255, green: 86/255, blue: 226/255, alpha: 1.0) /* #2456e2 */)
        view.addSubview(sc)
        
        scrollViewObj.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        scrollViewObj.delegate = self
        scrollViewObj.isPagingEnabled = true
        scrollViewObj.showsHorizontalScrollIndicator = false
        scrollViewObj.showsVerticalScrollIndicator = false
        scrollViewObj.contentSize = CGSize(width: screenWidth*3.0, height: screenHeight)
        self.view.addSubview(scrollViewObj)
        
        for i in 0 ..< Int(scrollViewObj.contentSize.width/screenWidth)
        {
//            let font = UIFont(name: "Helvetica", size: 20.0)
//            var height = heightForView(text: arrTitle[i], font: font!, width: self.view.frame.size.width-20)
            
            let ivImage = UIImageView(frame: CGRect(x: screenWidth*CGFloat(i), y: 0, width: screenWidth, height: screenHeight-(screenHeight/3)-40))
            ivImage.image = UIImage(named: "Background")
            ivImage.contentMode = .scaleToFill
            ivImage.clipsToBounds = true
            scrollViewObj.addSubview(ivImage)
            
            let ivImage2 = UIImageView(frame: CGRect(x: screenWidth*CGFloat(i)+screenWidth/2-((screenWidth/2)/2), y: ivImage.frame.origin.y+(ivImage.frame.size.height/2-(ivImage.frame.size.height/2)/2), width: screenWidth/2, height: ivImage.frame.size.height/2))
            ivImage2.image =  arrImg[i]
            ivImage2.contentMode = .scaleAspectFit
            ivImage2.clipsToBounds = true
            scrollViewObj.addSubview(ivImage2)
            
            let button = UIButton(frame: CGRect(x: screenWidth*CGFloat(i)+(screenWidth-60), y: 40, width: 50, height: 30))
            button.setTitle("SKIP", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(self.pressButton(_:)), for: .touchUpInside)
            scrollViewObj.addSubview(button)
            
            let title = UILabel(frame: CGRect(x: screenWidth*CGFloat(i)+10, y: ivImage.frame.origin.y+ivImage.frame.size.height+5, width: screenWidth-20, height: 80))
            title.text = arrTitle[i]
            title.textAlignment = .center
            title.numberOfLines = 0
            title.font = UIFont.boldSystemFont(ofSize: 30.0)
            scrollViewObj.addSubview(title)
            
            let Description = UILabel(frame: CGRect(x: screenWidth*CGFloat(i)+10, y: title.frame.origin.y+title.frame.size.height, width: screenWidth-20, height: 120))
            Description.text = arrDescription[i]
            Description.textAlignment = .center
            Description.textColor = UIColor.lightGray
            Description.numberOfLines = 0
            Description.font = UIFont.systemFont(ofSize: 17)
            scrollViewObj.addSubview(Description)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        sc.scroll_did(scrollView)
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
    
    @objc func pressButton(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

