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
    let alert = Alert()
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateJoinedLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var bio: String = ""
    var email: String = ""
    var eventsGoingTo: String = ""
    var ownEvents: String = ""
    
    
    var username: String = ""
    var uid: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = username
        
        ref = Database.database().reference()
        
        let userListRef = ref?.child("UserList")
        userListRef?.observeSingleEvent(of: .value, with: {(snapshot) in
            let valueDict  = snapshot.value! as! [String : String]
            let keyArray = (valueDict as NSDictionary).allKeys(for: String(self.username)) as! [String]
            self.uid = keyArray[0]
            print("uid", self.uid)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (0.5)) {
            print("uid,",self.uid)
            let userRef = self.ref?.child("Users").child(self.uid)
            userRef?.observeSingleEvent(of: .value, with: {(snapshot) in
                let value  = snapshot.value as? [String:String]
                self.bio = (value?["bio"])!
                self.email = (value?["email"])!
                self.eventsGoingTo = (value?["eventsGoingTo"])!
                self.ownEvents = (value?["ownEvents"])!
                print(self.bio)
                
            })
        }
        
        populateLabels()
        print()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFriendButton(_ sender: Any) {
        let specificFriendRef = ref?.child("FriendsList").child(username)
        let friendListRef = ref?.child("eventNameList")
        
        let newFriendDict = ["username": username, "bio": bio]

        
        
        friendListRef?.child(username).setValue(username)
        specificFriendRef?.setValue(newFriendDict)
        
        navigationController?.popViewController(animated: true)
    }
    
    func populateLabels()
    {
        usernameLabel.text = username
        dateJoinedLabel.text = "date"
        bioLabel.text = bio
    }
}

