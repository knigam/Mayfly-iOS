//
//  FirstViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/20/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class FirstViewController: NotificationsViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var eventTableView: UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        var eventViewController: EventViewController = segue.destinationViewController as EventViewController
        var eventIndex = eventTableView!.indexPathForSelectedRow().row
        var selectedEvent = self.notifications[eventIndex]
        eventViewController.event = selectedEvent
    }
    
    @IBAction func createEventOnClick(sender: AnyObject) {
        let newEventViewController = self.storyboard.instantiateViewControllerWithIdentifier("NewEventViewController") as NewEventViewController
        
        self.navigationController.pushViewController(newEventViewController, animated: true)
    }
    
    override func populateNotifications() {
        let uri: String = "http://staging.mymayfly.com/events.json"
        HTTPHelper.httpGet(uri, delegate: self)
    }
    
    override func didReceiveHTTPResponseResults(results: NSDictionary) {
        notifications = []
        for n in results["events"] as [[String: AnyObject]]{
            let event: EventModel = EventModel(id: n["id"] as AnyObject? as Int)
            event.name = n["name"] as AnyObject? as String
            event.attending = n["attending"] as AnyObject? as Bool
            event.creator = n["creator"] as AnyObject? as Bool
            self.notifications.append(event)
        }
        self.eventTableView.reloadData()
    }
}

