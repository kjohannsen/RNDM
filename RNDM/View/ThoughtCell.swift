//
//  ThoughtCell.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/14/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit
import Firebase

class ThoughtCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var thoughtTextLabel: UILabel!
    @IBOutlet weak var likesImage: UIImageView!
    @IBOutlet weak var numLikesLabel: UILabel!
    
    private var specificThought: Thought!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeImageTapped))
        likesImage.addGestureRecognizer(tap)
        likesImage.isUserInteractionEnabled = true
    }
    
    @objc func likeImageTapped() {
        //Method 1 - Can choose to overwrite data instead of merging.
//        Firestore.firestore().collection(THOUGHTS_REF).document(specificThought.documentID)
//        .setData([NUM_LIKES : specificThought.numLikes + 1], merge: true)
        
        //Method 2 - Automatically merges data
        Firestore.firestore().collection(THOUGHTS_REF).document(specificThought.documentID)
        .updateData([NUM_LIKES : specificThought.numLikes + 1])
    }
    
    func configureCell(thought: Thought) {
        self.specificThought = thought
        usernameLabel.text = thought.username
        thoughtTextLabel.text = thought.thoughtText
        numLikesLabel.text = String(thought.numLikes)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        let formattedTimestamp = formatter.string(from: thought.timestamp.dateValue())
        timestampLabel.text = formattedTimestamp
        
    }


}
