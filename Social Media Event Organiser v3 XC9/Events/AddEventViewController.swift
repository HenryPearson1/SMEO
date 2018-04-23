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
        
        let newEvent = Event(name: name, description: description, location: location, time: time, going: [going])
        let eventDict = ["name": name, "description": description, "location": location, "time": time, "going": going]
        print("struct", newEvent)
        print("dict", eventDict)
        ref?.child("Events").setValue(eventDict)
    }
    
    override func viewDidLoad() {
        ref = Database.database().reference()
        let eventsRef = ref?.child("Events")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

