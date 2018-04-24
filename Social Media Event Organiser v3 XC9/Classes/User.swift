//
//  User.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Henry Pearson on 21/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class User {
    // info about events
    var email: String
    var username: String
    var bio: String
    var ownEvents: Array<Event>
    var goingToEvents: Array<Event>
    
    
    init(inputEmail: String, inputUserName: String, inputBio: String, inputOwnEvents: Array<Event>, inputGoingToEvents: Array<Event>) {
        email = inputEmail
        username = ""
        bio = ""
        ownEvents = inputOwnEvents
        goingToEvents = inputGoingToEvents
    }
    
    func goToEvent(eventGoing: Event) {
        goingToEvents.append(eventGoing)
        eventGoing.numberOfPeopleGoing += 1
        let ref = Database.database().reference()
        let specificEventPartRef = ref.child("Events").child(eventGoing.name).child("numberOfPeopleGoing")
        specificEventPartRef.setValue(eventGoing.numberOfPeopleGoing)
    }
    
    // uploads event to firebase
    func createEvent(inputEvent: Event) {
        ownEvents.append(inputEvent)
        let ref = Database.database().reference()
        let name = inputEvent.name
        let eventDict = ["name": inputEvent.name, "description": inputEvent.description, "location": inputEvent.location, "time": inputEvent.time, "numberOfPeopleGoing": 0] as [String : Any]
        let specificEventRef = ref.child("Events").child(name)
        let eventListRef = ref.child("eventNameList")
        eventListRef.child(name).setValue(name)
        specificEventRef.setValue(eventDict)
        
    }
    /*
    func addFriend(friendToAdd: User) {
        friends.append(friendToAdd)
    }
    */
}
