//
//  eventStruct.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Cosimo Lewis on 21/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation


struct Event {
class Event {
    
    var name: String
    var description: String
    var location: String 
    var time: String
<<<<<<< HEAD
    var going = [String]() //Needs changing once user class is ready
    
    /*
    func addEvent(inputUser: User) {
        going.append(inputUser)
     }
 */
 
=======
    var going = [User]()
    init(inputName: String, inputDescription: String, inputLocation: String, inputTime: String) {
        name = inputName
        description = inputDescription
        location = inputLocation
        time = inputTime
    }

>>>>>>> c6f3051ee00a3e5cedde70146f080f151c4e8d09
}
