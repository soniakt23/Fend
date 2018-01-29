//
//  ViewController.swift
//  Fend App
//
//  Created by Katelyn Ge on 1/21/18.
//  Copyright © 2018 Fend. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    var dict : [String : AnyObject]!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
<<<<<<< HEAD
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        /*let screenSize:CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height //real screen height
        //let's suppose we want to have 10 points bottom margin
        let newCenterY = screenHeight - loginButton.frame.height - 10
        let newCenter = CGPoint(x: view.center.x, y: newCenterY)
        //let newCenter = CGPoint(view.center.x, newCenterY)
        loginButton.center = newCenter*/
=======
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
>>>>>>> origin/master
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
        //if the user is already logged in
        if let accessToken = FBSDKAccessToken.current(){
            getFBUserData()
        }
        self.ref = Database.database().reference(fromURL: "fend1-7e1bd.firebaseio.com")
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                    self.ref.child("users").setValue(self.dict)
                }
            })
        }
    }
    
    
}

