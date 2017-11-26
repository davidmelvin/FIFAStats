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

    @IBOutlet weak var userTeamTextField: UITextField!
    @IBOutlet weak var opponentTeamTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
//        if let userScore = userScoreTextField.text {
//            if let userScoreInt = Int(userScore) {
//                if let opponentScore = opponentScoreTextField.text {
//                    if let opponentScoreInt = Int(opponentScore) {
//                        let scores = [userScoreInt, opponentScoreInt]
//                    }
//                }
//            }
//        }
//        let users = [User.loggedInPlayer(), User.getUserByUsername(username: "opponent")]
//        let match = Match(players: users, scores: [1])
//        User.loggedInPlayer().games.append(match)
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
