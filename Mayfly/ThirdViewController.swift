//
//  ThirdViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/20/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class ThirdViewController: NotificationsViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var eventTableView: UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func populateNotifications() {
        if notifications.isEmpty{
            for i in Range(start: 0, end: 5) {
                let newEvent = EventModel(id: 1, name: "Test Event \(i)", eventDescription: "This is a test event \(i)", startTime: "1:00 AM", endTime: "2:00 PM", location: "80 Lafayette St.", min: 0, max: 1, attending: true, creator: true, open: true, active: true, usersAttending: [1:"Kushal"])
                self.notifications.append(newEvent)
            }
        }
    }
}