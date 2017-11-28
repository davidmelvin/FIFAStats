//
//  Match.swift
//  FIFAStats
//
//  Created by David Melvin on 11/26/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Match {
    let team1: Team
    let team2: Team
    let key: String
    var ref: DatabaseReference?
    
    init(team1: Team, team2: Team, key: String = "") {
        self.team1 = team1
        self.team2 = team2
        self.key = key
        self.ref = nil
    }
    
    init?(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        guard let team1 = Team(snapshotValue: snapshotValue["team1"] as! [String : AnyObject]), let team2 = Team(snapshotValue: snapshotValue["team2"] as! [String : AnyObject])
        else {return nil}
        
        self.team1 = team1
        self.team2 = team2
        
        ref = snapshot.ref
    }
    
    func toDictionary() -> Any {
        return [
            "team1": team1.toDictionary(),
            "team2": team2.toDictionary()
        ]
    }
}

struct Team {
    let clubName: String
    let score: Int
    let playerIDs: [String]
    
    init?(snapshotValue: [String:AnyObject]) {       
        guard let clubName = snapshotValue["clubName"] as? String, let score = snapshotValue["score"] as? Int,
            let IDArray = snapshotValue["playerIDs"] as? NSArray
            
            else {return nil}
        
        self.clubName = clubName
        self.score = score
        self.playerIDs = (IDArray as! Array).filter {$0 is String}
    }
    
    init(clubName: String, score: Int, playerIDs: [String]) {
        self.clubName = clubName
        self.score = score
        self.playerIDs = playerIDs
    }
    
    func toDictionary() -> Any {
        return [
            "clubName": clubName,
            "score": score,
            "playerIDs": playerIDs
        ]
    }
}
