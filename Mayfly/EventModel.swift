//
//  EventModel.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/26/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import Foundation

class EventModel {
    var id: Int
    var name: String
    var eventDescription: String
    var startTime: String
    var endTime: String
    var location: String
    var min: Int
    var max: Int
    var attending: Bool
    var creator: Bool
    var open: Bool
    var active: Bool
    var usersAttending: Dictionary<Int, String>
    
    init(id:Int, name:String, eventDescription:String, startTime:String, endTime:String, location:String, min:Int, max:Int, attending:Bool, creator:Bool, open:Bool, active:Bool, usersAttending:Dictionary<Int, String>) {
        self.id = id
        self.name = name
        self.eventDescription = eventDescription
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.min = min
        self.max = max
        self.attending = attending
        self.creator = creator
        self.open = open
        self.active = active
        self.usersAttending = usersAttending
    }
    
    init(id: Int) {
        self.id = id
        var uri:String = "mymayfly.com/event/\(id).json"
        //Step 1: Get the JSON for the event
        
        //Step 2: parse json and make event
        self.name = ""
        self.eventDescription = ""
        self.startTime = ""
        self.endTime = ""
        self.location = ""
        self.min = 0
        self.max = 0
        self.attending = false
        self.creator = false
        self.open = false
        self.active = false
        self.usersAttending = [0:""]
    }
}