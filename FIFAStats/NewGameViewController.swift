//
//  NewGameViewController.swift
//  FIFAStats
//
//  Created by David Melvin on 11/23/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class NewGameViewController: UIViewController {
    
    @IBOutlet weak var team1Score: UITextField!
    @IBOutlet weak var team2Score: UITextField!
    @IBOutlet weak var team1ClubName: UITextField!
    @IBOutlet weak var team2ClubName: UITextField!
    
    
    let databaseRef = Database.database().reference()
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        databaseRef.keepSynced(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Auth.auth().addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            
            self.user = User(uid: user.uid, email: user.email!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
                present(vc, animated: true, completion: nil)

                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

    
    @IBAction func submitNewMatch(_ sender: Any) {
        guard let team1Score = team1Score?.text, let team1ScoreInt = Int(team1Score), let team2Score = team2Score?.text, let team2ScoreInt = Int(team2Score),
            let team1ClubName = team1ClubName?.text, let team2ClubName = team2ClubName?.text
            
            else {return}
        
        
        let team1 = Team(clubName: team1ClubName, score: team1ScoreInt, playerIDs: ["3141"])
        let team2 = Team(clubName: team2ClubName, score: team2ScoreInt, playerIDs: ["3143"])
        let match = Match(team1: team1, team2: team2)
        
        let userRef = self.databaseRef.child(self.user.uid)
        let matchRef = userRef.child("matches").childByAutoId()
        matchRef.setValue(match.toDictionary())
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
