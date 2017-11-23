//
//  User.swift
//  FIFAStats
//
//  Created by David Melvin on 11/23/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String = ""
    var games: [Match] = []
    
    init(username: String) {
        name = username
    }
    
    static func loggedInPlayer() -> User{
        return User(username: "loggedInUser")
    }
    
    static func getUserByUsername(username: String) -> User{
        return User(username: username)
    }
}
