//
//  EventViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/26/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    var event: EventModel?
    
    @IBOutlet var titleLabel: UILabel
    @IBOutlet var timeLabel: UILabel
    @IBOutlet var locationLabel: UILabel
    @IBOutlet var descriptionLabel: UILabel
    @IBOutlet var minMaxLabel: UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = event?.name
        timeLabel.text = "\(event?.startTime) to \(event?.endTime)"
        locationLabel.text = event?.location
        descriptionLabel.text = event?.eventDescription
        if(event?.min > -1) {
            minMaxLabel.text = "Min: \(event?.min)  "
            minMaxLabel.hidden = false
        }
        if(event?.max > -1) {
            minMaxLabel.text = "\(minMaxLabel.text)Max: \(event?.max)"
            minMaxLabel.hidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onAttendingToggle(sender: AnyObject) {
    }
    
    @IBAction func inviteOnClick(sender: AnyObject) {
        let inviteViewController = self.storyboard.instantiateViewControllerWithIdentifier("InviteViewController") as InviteViewController
        
        self.navigationController.pushViewController(inviteViewController, animated: true)
    }
}
