//
//  User.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Henry Pearson on 21/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation

class User {
    // info about events
    var email: String
    var username: String
    var bio: String
    var ownEvents = [Event]()
    var goingToEvents = [Event]()
    
    init(inputEmail: String, inputUserName: String, inputBio: String) {
        email = inputEmail
        username = ""
        bio = ""
    }
    
    func goToEvent(eventGoing: Event) {
        goingToEvents.append(eventGoing)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        eventGoing.addEvent(inputUser: self)
>>>>>>> parent of 9fd0826... Fix merge conflict
        eventGoing.going.append(self)
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
        eventGoing.addEvent(inputUser: self)
    }
>>>>>>> parent of ed7ab64... Merge branch 'master' of https://github.com/HenryPearson1/SMEO
    */
=======
    
>>>>>>> parent of 0991ade... Added Save UIBarButtonItem
    
}
