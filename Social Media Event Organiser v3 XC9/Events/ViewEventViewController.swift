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
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        print(eventName)

        
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
