//
//  CommentCell.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/24/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(comment: Comment) {
        usernameLabel.text = comment.username
        commentLabel.text = comment.commentText
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        let formattedTimestamp = formatter.string(from: comment.timestamp.dateValue())
        timestampLabel.text = formattedTimestamp
    }

}
