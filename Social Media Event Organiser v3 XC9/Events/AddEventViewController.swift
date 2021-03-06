//
//  AddEventViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 20/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddEventViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var locText: UITextField!
    @IBOutlet weak var timeText: UITextField!

    
    @IBAction func addEvent(_ sender: Any) {
        
        let name = nametext.text!
        let description = descText.text!
        let location = locText.text!
        let time = timeText.text!
        let going = ""
        
        let specificEventRef = ref?.child("Events").child(name)
        let eventListRef = ref?.child("eventNameList")

        let newEvent = Event(name: name, description: description, location: location, time: time, going: [going])
        let eventDict = ["name": name, "description": description, "location": location, "time": time, "going": going]
        
        
        print("struct", newEvent)
        print("dict", eventDict)
        
        eventListRef?.child(name).setValue(name)
        specificEventRef?.setValue(eventDict)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

}

