//
//  NotificationsViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/27/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onEventClick(sender: AnyObject) {
        let eventController = self.storyboard.instantiateViewControllerWithIdentifier("eventController") as EventViewController
        eventController.event = EventModel(id: 1, name: "Test Event", eventDescription: "This is a test event", startTime: "1:00 AM", endTime: "2:00 PM", location: "80 Lafayette St.", min: 0, max: 1, attending: true, creator: true, open: true, active: true, usersAttending: [1:"Kushal"])
        self.presentViewController(eventController, animated: true, completion: nil)
    }
    
}