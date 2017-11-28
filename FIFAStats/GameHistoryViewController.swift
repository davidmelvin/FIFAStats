//
//  GameHistoryViewController.swift
//  FIFAStats
//
//  Created by David Melvin on 11/26/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import UIKit
import Firebase

class GameHistoryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var gameHistoryTableView: UITableView!
    
    var user: User!
//    let team11 = Team(clubName: "Test1", score: 4, playerIDs: ["3141"])
//    let team21 = Team(clubName: "Test2", score: 5, playerIDs: ["3141"])
    var matches: [Match] = []
    
    let databaseRef = Database.database().reference()
    
    override func viewWillAppear(_ animated: Bool) {
        databaseRef.keepSynced(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Auth.auth().addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            
            self.user = User(uid: user.uid, email: user.email!)
            self.fetchMatches()
        }
        
        
        if let user = Auth.auth().currentUser{
            self.user = User(uid: user.uid, email: user.email!)
            fetchMatches()
        }
        
        gameHistoryTableView.dataSource = self
    }
    
    func fetchMatches() {
        let userMathcesRef = databaseRef.child(user.uid).child("matches")
        userMathcesRef.observe(.value, with: { (snapshot) in
            var newItems: [Match] = []
            
            for item in snapshot.children {
                if let match = Match(snapshot: item as! DataSnapshot){
//                    print(match)
                    // why are there duplicates? :(
                    newItems.append(match)
                }
            }
            self.matches = newItems
            print("newItems.count: \(newItems.count)")
            print("matches count inside observer \(self.matches.count)")
            
            self.gameHistoryTableView.reloadData()
        })
        
        self.gameHistoryTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("matches count: \(self.matches.count)")
        return self.matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameHistoryTableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchTableViewCell
        let match = matches[indexPath.row]
        
        print("trying to render this match into a cell: \(match)")
        let team1Score = match.team1.score
        let team1Name = match.team1.clubName
        let team2Score = match.team2.score
        let team2Name = match.team2.clubName
        cell.team1Score.text = String(team1Score)
        cell.team2Score.text = String(team2Score)
        cell.team1ClubName.text = team1Name
        cell.team2ClubName.text = team2Name
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
