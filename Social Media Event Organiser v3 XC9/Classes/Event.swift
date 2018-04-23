//
//  eventStruct.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Cosimo Lewis on 21/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation

struct Event {
    
    var name: String
    var description: String
    var location: String 
    var time: String
    var going = [User]()
    
    func addEvent(inputUser: User) {
        going.append(inputUser)
    }
}
