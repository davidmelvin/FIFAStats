//
//  Match.swift
//  FIFAStats
//
//  Created by David Melvin on 11/26/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import Foundation

struct Match {
    let team1: Team
    let team2: Team
}

struct Team {
    let clubName: String
    let score: Int
    let players: [User]
}
