//
//  InviteViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 8/3/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class InviteViewController: FriendsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateFriends()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitInvites(sender: AnyObject) {
        //send invites to server
        
        //then return to event
        self.navigationController.popViewControllerAnimated(true)
    }
}
