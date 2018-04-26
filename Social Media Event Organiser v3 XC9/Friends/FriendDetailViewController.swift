//
//  FriendDetailViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 24/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase

class FriendDetailViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    
    var username: String = ""
    var uid: String = ""
    
    override func viewDidLoad() {
        print(username)
        super.viewDidLoad()
        ref = Database.database().reference()
        
        let userListRef = ref?.child("UserList")
        userListRef?.observeSingleEvent(of: .value, with: {(snapshot) in
            let valueDict  = snapshot.value! as! [String : String]
            let keyArray = (valueDict as NSDictionary).allKeys(for: String(self.username)) as! [String]
            self.uid = keyArray[0]
            print("uid", self.uid)
        })
        getData()
        print()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getData()
    {
        let userRef = ref?.child("Users").child(uid)
        userRef?.observeSingleEvent(of: .value, with: {(snapshot) in
            let value  = snapshot.value as? NSDictionary
            let bio = value?["bio"]
            let email = value?["email"]
            let eventsGoingTo = value?["eventsGoingTo"]
            let ownEvents = value?["ownEvents"]
            print(bio)
            
        })
    }
}

