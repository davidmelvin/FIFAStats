//
//  GameHistoryViewController.swift
//  FIFAStats
//
//  Created by David Melvin on 11/26/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import UIKit

class GameHistoryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var gameHistoryTableView: UITableView!
    let team11 = Team(clubName: "Test1", score: 4, players: [User(uid: "3141", email: "johnny@test.com")])
    let team21 = Team(clubName: "Test2", score: 5, players: [User(uid: "3141", email: "johnny@test.com")])
    var matches: [Match] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.matches = [Match(team1: team11, team2: team21)]
        gameHistoryTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameHistoryTableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchTableViewCell
        let match = matches[indexPath.row]
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
