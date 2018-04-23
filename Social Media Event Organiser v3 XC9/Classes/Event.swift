//
//  eventStruct.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Cosimo Lewis on 21/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation


<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
struct Event {
>>>>>>> parent of 9fd0826... Fix merge conflict
class Event {
=======
struct Event {
>>>>>>> parent of ed7ab64... Merge branch 'master' of https://github.com/HenryPearson1/SMEO
=======
struct Event {
>>>>>>> parent of c6f3051... fixed issues
    
    var name: String
    var description: String
    var location: String 
    var time: String
    var going = [String]() //Needs changing once user class is ready
    
    func addEvent(inputUser: User) {
        going.append(inputUser)
<<<<<<< HEAD
<<<<<<< HEAD
     }
 */
 
<<<<<<< HEAD
=======
    var going = [User]()
    init(inputName: String, inputDescription: String, inputLocation: String, inputTime: String) {
        name = inputName
        description = inputDescription
        location = inputLocation
        time = inputTime
    }

>>>>>>> c6f3051ee00a3e5cedde70146f080f151c4e8d09
=======
    }
>>>>>>> parent of 0991ade... Added Save UIBarButtonItem
=======
>>>>>>> parent of ed7ab64... Merge branch 'master' of https://github.com/HenryPearson1/SMEO
=======
    }
>>>>>>> parent of c6f3051... fixed issues
}
