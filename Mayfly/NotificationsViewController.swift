//
//  NotificationsViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/27/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, HTTPHelperDelegate {
    
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
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return notifications.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        cell.textLabel.text = notifications[indexPath.row].name
        cell.detailTextLabel.text = notifications[indexPath.row].eventDescription
        
        return cell
    }
    
//    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
//        let eventController = self.storyboard.instantiateViewControllerWithIdentifier("EventViewController") as EventViewController
//        eventController.event = notifications[indexPath.row]
//        self.presentViewController(eventController, animated: true, completion: nil)
//    }
    
    //Use this method to get the events from the JSON and create event models for the notifications array
    func populateNotifications() {
        let uri: String = "http://staging.mymayfly.com/events.json"
        HTTPHelper.httpGet(uri, delegate: self)
    }
    
    func didReceiveHTTPResponseResults(results: NSDictionary) {
        notifications = []
        for n in results["events"] as [AnyObject]{
            let event: EventModel = EventModel(id: (n["id"] as Int))
            event.name = n["name"] as String
            event.attending = n["attending"] as Bool
            event.creator = n["creator"] as Bool
            self.notifications.append(event)
        }
    }
}