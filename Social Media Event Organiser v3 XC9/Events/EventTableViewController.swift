//
//  EventTableViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 20/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EventTableViewController: UITableViewController {

    var nameArray = [String]()
    var eventSelected: String = ""
    
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        let eventRef = ref?.child("eventNameList")
        refHandle = eventRef?.observe(.childAdded, with: {(snapshot) in
            
            if let item = snapshot.value as? String
            {
                print(item)
                self.nameArray.append(item)
                self.tableView.reloadData()
            }
        })

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventSelected = nameArray[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let event = nameArray[indexPath.row]
        cell.textLabel?.text = event
        return cell 
    }

    override func viewDidAppear(_ animated: Bool)
    {
        ref?.child("currentSession").child("eventCount").setValue(nameArray.count)
        print(nameArray)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail"
        {
            let destVC = segue.destination as! ViewEventViewController
            destVC.eventName = eventSelected
        }
    }


}
