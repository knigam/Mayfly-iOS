//
//  FriendModel.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/26/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import Foundation

class FriendModel {
    
    var friendId: Int
    var friendName: String
    var userName: String
    
    init(friendId: Int, friendName: String, userName: String) {
        self.friendId = friendId
        self.friendName = friendName
        self.userName = userName
    }
    
    //This will be used once viewing friend info is implemented
    init(friendId: Int){
        self.friendId = friendId
        var uri:String = "mymayfly.com/friends/\(friendId).json"  //route needs to be created
        //Step 1: Get the JSON for the friend
        
        //Step 2: parse json and make friend
        self.friendName = ""
        self.userName = ""
    }
}
