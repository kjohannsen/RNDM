//
//  Comment.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/24/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import Foundation
import Firebase

class Comment {
    private(set) var username: String!
    private(set) var timestamp: Timestamp!
    private(set) var commentText: String!
    
    init(username: String, timestamp: Timestamp, commentText: String) {
        self.username = username
        self.timestamp = timestamp
        self.commentText = commentText
    }
}
