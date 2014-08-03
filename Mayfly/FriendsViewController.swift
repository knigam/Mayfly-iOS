//
//  FriendsViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/26/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let kCellIdentifier: String = "FriendCell"
    var friends: [FriendModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateFriends()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return friends.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        cell.textLabel.text = friends[indexPath.row].friendName
        cell.detailTextLabel.text = friends[indexPath.row].userName
        
        return cell
    }
    
    func populateFriends() {
        if friends.isEmpty{
            for i in Range(start: 0, end: 10) {
                let newFriend = FriendModel(friendId: 0, friendName: "friend \(i)", userName: "friend \(i) username")
                self.friends.append(newFriend)
            }
        }
    }

}
