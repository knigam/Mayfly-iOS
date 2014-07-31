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
}

