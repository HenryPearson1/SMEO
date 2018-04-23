//
//  eventStruct.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Cosimo Lewis on 21/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation


class Event {
    
    var name: String
    var description: String
    var location: String 
    var time: String
    var numberOfPeopleGoing: Int
    init(inputName: String, inputDescription: String, inputLocation: String, inputTime: String) {
        name = inputName
        description = inputDescription
        location = inputLocation
        time = inputTime
        numberOfPeopleGoing = 0
    }
    

}
