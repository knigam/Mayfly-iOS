//
//  NotificationsViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/27/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    let kCellIdentifier: String = "EventNotificationCell"
    
    var notifications: [EventModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateNotifications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onEventClick(sender: AnyObject) {
        let eventController = self.storyboard.instantiateViewControllerWithIdentifier("eventController") as EventViewController
        eventController.event = notifications[0]
        self.presentViewController(eventController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return notifications.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        cell.textLabel.text = notifications[indexPath.row].name
        cell.detailTextLabel.text = notifications[indexPath.row].eventDescription
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {        
        let eventController = self.storyboard.instantiateViewControllerWithIdentifier("eventController") as EventViewController
        eventController.event = notifications[indexPath.row]
        self.presentViewController(eventController, animated: true, completion: nil)
    }
    
    //Use this method to get the events from the JSON and create event models for the notifications array
    func populateNotifications() {
        if notifications.isEmpty{
            for i in Range(start: 0, end: 10) {
            let newEvent = EventModel(id: 1, name: "Test Event \(i)", eventDescription: "This is a test event \(i)", startTime: "1:00 AM", endTime: "2:00 PM", location: "80 Lafayette St.", min: 0, max: 1, attending: true, creator: true, open: true, active: true, usersAttending: [1:"Kushal"])
            self.notifications.append(newEvent)
            }
        }
    }
}