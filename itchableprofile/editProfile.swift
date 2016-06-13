//
//  editProfile.swift
//  itchableprofile
//
//  Created by Nicholas  Dalke on 6/8/16.
//  Copyright © 2016 Nicholas  Dalke. All rights reserved.
//

//
//  Profile.swift
//  FireChat-Swift
//
//  Created by Osama Alfares on 1/2/16.
//  Copyright © 2016 Firebase. All rights reserved.
//

import UIKit
import Firebase


class editProfile: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor(red: 0.663, green: 0.365, blue: 0.451, alpha: 1)
        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let user_id = "1704306156504044"
        
        //        let user_id = defaults.stringForKey("userid")
        
        let myRootRef = Firebase(url:"https://itchable.firebaseio.com/users/" + user_id)
        
        
        /*
         let profileTitle = UILabel(frame: CGRectMake(0, 0, self.view.bounds.size.width, 80))
         profileTitle.text = "Profile"
         profileTitle.textAlignment = NSTextAlignment.Center
         profileTitle.numberOfLines = 0
         profileTitle.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
         profileTitle.textColor = UIColor(red: 67/255, green: 28/255, blue: 93/255, alpha: 1)
         profileTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
         self.view.addSubview(profileTitle)
         */
        
        let backButton = UIButton(frame: CGRectMake( 20,  30  , 30, 30))
        backButton.setImage(UIImage(named: "backButton"), forState: UIControlState.Normal)
        backButton.addTarget(self, action: "backAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(backButton)
        
        var profileOwnerPic = UIImageView(frame: CGRectMake(self.view.bounds.size.width/2 - 65, 30, 130, 130))
        profileOwnerPic.layer.borderWidth = 2
        profileOwnerPic.layer.masksToBounds = false
        profileOwnerPic.layer.borderColor = UIColor.whiteColor().CGColor
        profileOwnerPic.layer.cornerRadius = profileOwnerPic.frame.height/2
        profileOwnerPic.clipsToBounds = true
        self.view.addSubview(profileOwnerPic)
        
        let userName = UILabel(frame: CGRectMake(0, 160, self.view.bounds.size.width, 40))
        let ageLocation = UILabel(frame: CGRectMake(0, 180, self.view.bounds.size.width, 40))
        
        let userOccupancy = UILabel(frame: CGRectMake(60, 240, self.view.bounds.size.width, 40))
        let userCollege = UILabel(frame: CGRectMake(60, 280, self.view.bounds.size.width, 40))
        let userLocation = UILabel(frame: CGRectMake(60, 320, self.view.bounds.size.width, 40))
        let userDesc = InsetLabel(frame: CGRectMake(40, 360, self.view.bounds.size.width - 50, 80))
        
        
        myRootRef.observeEventType(.Value, withBlock: {snapshot in
            print((snapshot.value["userName"] as? String)!)
            userName.text = ((snapshot.value["userName"] as? String)!)
            print((snapshot.value["userPic"] as? String)!)
            
            let pictureProfile = snapshot.value["userPic"] as! String
            
            if let checkedUrl = NSURL(string: pictureProfile ) {
                self.downloadImage(checkedUrl, img: profileOwnerPic)
            }
            
            //            ageLocation.text = ((snapshot.value["userLocation"] as? String)!)
            //            userOccupancy.text = ((snapshot.value["userOccupancy"] as? String)!)
            //            userCollege.text = ((snapshot.value["userCollege"] as? String)!)
            //            userDesc.text = ((snapshot.value["userDesc"] as? String)!)
        })
        
        
        
        
        userName.textAlignment = NSTextAlignment.Center
        userName.numberOfLines = 0
        userName.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        userName.textColor = UIColor(red: 67/255, green: 28/255, blue: 93/255, alpha: 1)
        userName.font = UIFont(name:"HelveticaNeue", size: 18.0)
        self.view.addSubview(userName)
        
        ageLocation.textAlignment = NSTextAlignment.Center
        ageLocation.numberOfLines = 0
        ageLocation.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        ageLocation.textColor = UIColor(red: 2/255, green: 2/255, blue: 2/255, alpha: 0.8)
        ageLocation.font = UIFont(name:"HelveticaNeue", size: 18.0)
        self.view.addSubview(ageLocation)
        
        
        userOccupancy.textAlignment = NSTextAlignment.Left
        userOccupancy.numberOfLines = 0
        userOccupancy.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        userOccupancy.textColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
        userOccupancy.font = UIFont(name:"HelveticaNeue", size: 18.0)
        self.view.addSubview(userOccupancy)
        
        let briefCase = UIImageView(frame: CGRectMake(10, 237, 45, 45))
        briefCase.image = UIImage(named:"briefcase")
        self.view.addSubview(briefCase)
        
        userCollege.textAlignment = NSTextAlignment.Left
        userCollege.numberOfLines = 0
        userCollege.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        userCollege.textColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
        userCollege.font = UIFont(name:"HelveticaNeue", size: 18.0)
        self.view.addSubview(userCollege)
        
        let diploma = UIImageView(frame: CGRectMake(10, 277, 45, 45))
        diploma.image = UIImage(named:"diploma")
        self.view.addSubview(diploma)
        
        userLocation.textAlignment = NSTextAlignment.Left
        userLocation.numberOfLines = 0
        userLocation.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        userLocation.textColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
        userLocation.font = UIFont(name:"HelveticaNeue", size: 18.0)
        self.view.addSubview(userLocation)
        
        let location = UIImageView(frame: CGRectMake(10, 319, 45, 45))
        location.image = UIImage(named:"house")
        self.view.addSubview(location)
        
        userDesc.textAlignment = NSTextAlignment.Left
        userDesc.numberOfLines = 4
        userDesc.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        userDesc.textColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
        userDesc.font = UIFont(name:"HelveticaNeue", size: 18.0)
        self.view.addSubview(userDesc)
        
        let likes = UIImageView(frame: CGRectMake(10, 370, 45, 45))
        likes.image = UIImage(named:"likes")
        self.view.addSubview(likes)
        
        
        let horizontalLine = UIView(frame: CGRectMake(0, 440, self.view.bounds.size.width, 1))
        horizontalLine.backgroundColor =  UIColor(red: 112/255, green: 138/255, blue: 144/255, alpha: 1)
        self.view.addSubview(horizontalLine)
        
        let settings = UIImageView(frame: CGRectMake(350, 677, 45, 45))
        settings.image = UIImage(named:"settings")
        self.view.addSubview(settings)
        
        
        let pastActivityTitle = UILabel(frame: CGRectMake(20, 450, self.view.bounds.size.width, 40))
        pastActivityTitle.text = "PAST ACTIVITIES"
        pastActivityTitle.textAlignment = NSTextAlignment.Left
        pastActivityTitle.numberOfLines = 0
        pastActivityTitle.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        pastActivityTitle.textColor = UIColor(red: 241/255, green: 102/255, blue: 100/255, alpha: 1)
        pastActivityTitle.font = UIFont(name:"HelveticaNeue", size: 22.0)
        self.view.addSubview(pastActivityTitle)
        
        let editTitle = UILabel(frame: CGRectMake(self.view.bounds.size.width - 70, 30, 80, 40))
        editTitle.text = "Edit"
        editTitle.textAlignment = NSTextAlignment.Left
        editTitle.numberOfLines = 0
        editTitle.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        editTitle.textColor = UIColor(red: 241/255, green: 102/255, blue: 100/255, alpha: 1)
        editTitle.font = UIFont(name:"HelveticaNeue", size: 20.0)
        self.view.addSubview(editTitle)
        
        let back = UIImageView(frame: CGRectMake(10, 30, 45, 45))
        back.image = UIImage(named:"back")
        self.view.addSubview(back)
        
        for ( var i = 0; i < 4; i += 1){
            let activityRow = UILabel(frame: CGRectMake(75, (500 + (38 * CGFloat(i))), self.view.bounds.size.width, 30))
            
            let dateRow = UILabel(frame: CGRectMake(0, (500 + (38 * CGFloat(i))), self.view.bounds.size.width, 30))
            
            
            myRootRef.observeEventType(.Value, withBlock: {snapshot in
                //                print((snapshot.value["activity"] as? String)!)
                //                activityRow.text = ((snapshot.value["activity" ++ ] as? String)!)
                //                dateRow.text = ((snapshot.value["activityDate" ++ ] as? String)!)
            })
            
            dateRow.textColor = UIColor(red: 67/255, green: 28/255, blue: 93/255, alpha: 1)
            dateRow.textAlignment = NSTextAlignment.Left
            dateRow.numberOfLines = 0
            dateRow.backgroundColor =  UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
            dateRow.font = UIFont(name:"HelveticaNeue", size: 16.0)
            self.view.addSubview(dateRow)
            
            
            
            activityRow.textAlignment = NSTextAlignment.Left
            activityRow.numberOfLines = 0
            activityRow.backgroundColor =  UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
            activityRow.textColor = UIColor(red: 2/255, green: 2/255, blue: 2/255, alpha: 0.8)
            activityRow.font = UIFont(name:"HelveticaNeue", size: 16.0)
            self.view.addSubview(activityRow)
        }
        
        
        
        
    }
    
    class InsetLabel: UILabel {
        override func drawTextInRect(rect: CGRect) {
            super.drawTextInRect(UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)))
        }
    }
    
    func backAction() ->Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func downloadImage(url: NSURL, img: UIImageView){
        // print("Started downloading \"\(url.URLByDeletingPathExtension!.lastPathComponent!)\".")
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                //    print("Finished downloading \"\(url.URLByDeletingPathExtension!.lastPathComponent!)\".")
                img.image = UIImage(data: data)
            }
        }
    }
    
    
}