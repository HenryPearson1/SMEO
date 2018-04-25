//
//  ViewEventViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 20/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
class ViewEventViewController: UIViewController {
    
    // get info from event record
    var event: Event!
    var eventName: String = ""
    var editIndex = 0
    
    var ref: DatabaseReference? 

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBAction func editAction(_ sender: Any)
    {
        editIndex = editIndex + 1
        if editIndex % 2 == 0
        {
            
            let name = nameTextField.text!
            let description = descriptionTextField.text!
            let location = locationTextField.text!
            let time = timeTextField.text!
            let going = ""
            
            let eventDict = ["name": name, "description": description, "location": location, "time": time, "going": going]
            
            let eventRef = ref?.child("Events").child(eventName)
            let newEventRef = ref?.child("Events").child(name)
            let eventNameRef = ref?.child("eventNameList")
            
            eventNameRef?.child(eventName).removeValue()
            eventRef?.child(eventName).removeValue()
            
            eventNameRef?.child(name).setValue(name)
            newEventRef?.setValue(eventDict)
            
            
            
            navigationController?.popViewController(animated: true)
        }
        if editIndex % 2 != 0
        {
            
            editOutlet.title = "Done"
            
            nameTextField.isEnabled = true
            descriptionTextField.isEnabled = true
            locationTextField.isEnabled = true
            timeTextField.isEnabled = true
            
            

        }
    }
    
    @IBOutlet weak var editOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        let eventRef = ref?.child("Events").child(eventName)

        eventRef?.observeSingleEvent(of: .value, with: {(snapshot) in
            let value  = snapshot.value as? NSDictionary
            let description = value?["description"]
            let location = value?["location"]
            let name = value?["name"]
            let numberOfPeopleGoing = value?["numberOfPeopleGoing"]
            let time = value?["time"]
            
        
            
            self.nameTextField.text = name as! String
            self.descriptionTextField.text = description as! String!
            self.locationTextField.text = location as! String
            self.timeTextField.text = time as! String
        })
        print(eventName)
        
        nameTextField.isEnabled = false
        descriptionTextField.isEnabled = false
        locationTextField.isEnabled = false
        timeTextField.isEnabled = false
     
        
            
        }
        
    }
