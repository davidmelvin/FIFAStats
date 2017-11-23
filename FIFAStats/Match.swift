//
//  Match.swift
//  FIFAStats
//
//  Created by David Melvin on 11/23/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import UIKit

class Match: NSObject {
    var players: [User]
    var scores: [Int]
    
    init(players: [User], scores: [Int]) {
        self.players = players
        self.scores = scores
    }

}
