//
//  ThoughtCell.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/14/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var thoughtTextLabel: UILabel!
    @IBOutlet weak var likesImage: UIImageView!
    @IBOutlet weak var numLikesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(thought: Thought) {
        
    }


}
