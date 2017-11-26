//
//  MatchTableViewCell.swift
//  FIFAStats
//
//  Created by David Melvin on 11/26/17.
//  Copyright © 2017 David Melvin. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var team1ClubName: UILabel!
    @IBOutlet weak var team2ClubName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
