//
//  User.swift
//  FIFAStats
//
//  Created by David Melvin on 11/26/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: User) {
        uid = authData.uid
        email = authData.email
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
}
