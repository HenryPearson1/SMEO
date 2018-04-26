//
//  MyAccountViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 24/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase

class MyAccountViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var dateJoinedLabel: UILabel!
    @IBOutlet weak var namLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var doneBarButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var doneBarButtonAction: UIBarButtonItem!
    
    var bio = ""
    var dateJoined = ""
    var currentUser = Auth.auth().currentUser?.uid
    var username = ""
    var valueDict: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        let userRef = ref.child("Users").child((currentUser)!)
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            self.valueDict = (snapshot.value as? [String:String])!
            self.bio = (self.valueDict["bio"])!
            self.dateJoined = (self.valueDict["dateJoined"])!
            self.username = (self.valueDict["username"])!
            print(self.valueDict)
            print(self.dateJoined)
            
        })

        print(valueDict[dateJoined])
        populateTextFields()
        print("done")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func populateTextFields()
    {
        dateJoinedLabel.text = dateJoined
        namLabel.text = username
        bioTextView.text = bio
    }

}
