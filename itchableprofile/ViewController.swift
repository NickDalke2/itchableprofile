//
//  ViewController.swift
//  itchableprofile
//
//  Created by Nicholas  Dalke on 4/27/16.
//  Copyright © 2016 Nicholas  Dalke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

//    let loginButton: FBSDKLoginButton = {
//            let button = FBSDKLoginButton()
//            button.readPermissions =  ["public_profile", "email", "education_experience", "place", "work_experience"];
//            return button
//        }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let objObjectiveCFile = ObjectiveCFile()
//        objObjectiveCFile.displayMessageFromCreatedObjectiveCFile()
//        view.addSubview(loginButton)
//        loginButton.center = view.center
//        loginButton.delegate = self
//        
//        if let token = FBSDKAccessToken.currentAccessToken(){
//            fetchProfile()
//        }
//    }
//
//    func fetchProfile() {
//        print("fetchProfile")
//    }
//    
//    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
//        print("completed login")
//        fetchProfile()
//    }
//    
//    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
//        
//    }
//    
//    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
//        return true
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}

    @IBOutlet var btn: FBSDKLoginButton!
    @IBOutlet var lblName: UILabel!
    
    let loginButton: FBSDKLoginButton = {
            let button = FBSDKLoginButton()
            button.readPermissions =  ["public_profile", "email", "education_experience", "place", "work_experience"];
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFacebook()
        view.backgroundColor = .yellowColor()

        let objObjectiveCFile = ObjectiveCFile()
        objObjectiveCFile.displayMessageFromCreatedObjectiveCFile()
        
        loginButton.delegate = self
        
        if let token = FBSDKAccessToken.currentAccessToken() {
            fetchProfile()
        }
    } 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureFacebook() {
        btn.readPermissions = ["public_profile", "email", "education_experience", "place", "work_experience"];
        btn.delegate = self
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
        print("completed login")
    }
    
    func fetchProfile() {
        print("fetch profile")
        
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"education_experience, place, work_experience"]).startWithCompletionHandler { (connection, result, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            
            if let strEducation: String = (result.objectForKey("education_experience") as? String)!{
                print(strEducation)
            }
            
            if let strPlace: String = (result.objectForKey("place") as? String)! {
                print(strPlace)
            }
            
            if let strWork: String = (result.objectForKey("work_experience") as? String)! {
                print(strWork)
            }
            
        }
        
    }

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        lblName.text = "hello"
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }

}

