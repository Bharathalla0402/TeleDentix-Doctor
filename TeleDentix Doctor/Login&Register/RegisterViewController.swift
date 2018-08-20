//
//  RegisterViewController.swift
//  TeleDentix Doctor
//
//  Created by think360 on 19/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class RegisterViewController: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate {
    
    @IBOutlet var txtFullName: ACFloatingTextfield!
    @IBOutlet var txtEmail: ACFloatingTextfield!
    @IBOutlet var txtMobileNumber: ACFloatingTextfield!
    @IBOutlet var txtPassword: ACFloatingTextfield!
    @IBOutlet var txtConfirmPassword: ACFloatingTextfield!
    
    @IBOutlet var FacebookView: UIView!
    @IBOutlet var googleView: UIView!
    
    var  faceBookDic = NSDictionary()
    var imageURL = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFullName.text = ""
        txtEmail.text = ""
        txtMobileNumber.text = ""
        txtPassword.text = ""
        txtConfirmPassword.text = ""
        
        FacebookView.layer.borderColor = #colorLiteral(red: 0, green: 0.3647058824, blue: 0.862745098, alpha: 1)
        FacebookView.layer.borderWidth = 2.0
        googleView.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.1103301843, blue: 0.150508742, alpha: 1)
        googleView.layer.borderWidth = 2.0
        
       

        // Do any additional setup after loading the view.
    }
    
   
    
     // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Register Butt Clicked
    @IBAction func RegisterButtClicked(_ sender: UIButton)
    {
        var message = String()
        
        if (txtFullName.text?.isEmpty)!
        {
            message = "Please Enter Full Name"
        }
        else if (txtEmail.text?.isEmpty)!
        {
            message = "Please Enter Your Email Id"
        }
        else if !AFWrapperClass.isValidEmail(txtEmail.text!)
        {
            message = "Please enter valid Email"
        }
        else if (txtMobileNumber.text?.isEmpty)!
        {
            message = "Please Enter Phone Number"
        }
        else if (txtPassword.text?.isEmpty)!
        {
            message = "Please Enter Your Password"
        }
        else if (txtConfirmPassword.text?.isEmpty)!
        {
            message = "Please Enter Your Confirm Password"
        }
        else if (!(txtPassword.text == txtConfirmPassword.text))
        {
            message = "Password and Confirm Password are not matching"
        }
        
        if message.count > 1
        {
            AFWrapperClass.alert(Constants.applicationName, message: message, view: self)
        }
        else
        {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as? TabbarController
            self.navigationController?.pushViewController(myVC!, animated: true)
        }
    }
    
    // MARK:  Facebook Butt Clicked
    @IBAction func FacebookButtClicked(_ sender: UIButton)
    {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile","email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        // fbLoginManager.logOut()
                    }
                    
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email, name, first_name, last_name, picture.type(large), id"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    self.faceBookDic = result as! [String : AnyObject] as NSDictionary
                    
                    print( self.faceBookDic)
                    let myVC = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as? TabbarController
                    self.navigationController?.pushViewController(myVC!, animated: true)
                

                }
            })
        }
    }
    
     // MARK:  Google Butt Clicked
    @IBAction func GoogleButtClicked(_ sender: UIButton)
    {
        GIDSignIn.sharedInstance().signOut()
        
        let sighIn:GIDSignIn = GIDSignIn.sharedInstance()
        sighIn.delegate = self;
        sighIn.uiDelegate = self;
        sighIn.shouldFetchBasicProfile = true
        sighIn.scopes = ["https://www.googleapis.com/auth/plus.login","https://www.googleapis.com/auth/userinfo.email","https://www.googleapis.com/auth/userinfo.profile","https://www.googleapis.com/auth/plus.me"];
        sighIn.clientID = "463827062322-qrba42b0t026rk1a8ugoa68lplsndhei.apps.googleusercontent.com"
        sighIn.signIn()
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        AFWrapperClass.svprogressHudDismiss(view: self);
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error != nil) {
            return
        }
        reportAuthStatus()
        
        //print("\(user.profile.name) \n \(user.profile.email) \n \(user.authentication.idToken) \n \(user.userID)")
        
        if GIDSignIn.sharedInstance().currentUser.profile.hasImage
        {
            //imageURL = user.profile.imageURL(withDimension: UInt(120)) as NSURL
           // print("Image Url : \(imageURL)")
        }
        
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as? TabbarController
        self.navigationController?.pushViewController(myVC!, animated: true)
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!)
    {
        if (error != nil) {
            
        }else
        {
            
        }
    }
    
    func reportAuthStatus() -> Void {
        let googleUser:GIDGoogleUser = GIDSignIn.sharedInstance().currentUser
        if (googleUser.authentication != nil)
        {
            print("Status: Authenticated")
        }else
        {
            print("Status: Not authenticated")
        }
        
    }
    func refreshUserInfo() -> Void {
        if GIDSignIn.sharedInstance().currentUser.authentication == nil {
            return
        }
        if !GIDSignIn.sharedInstance().currentUser.profile.hasImage {
            return
        }
    }

    
      // MARK:  SignIn Butt Clicked
    @IBAction func SignInButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
