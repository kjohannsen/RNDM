//
//  Thought.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/14/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import Foundation

struct Thought {
    
    private(set) var username: String!
    private(set) var timestamp: Date!
    private(set) var thoughtText: String!
    private(set) var numComments: Int!
    private(set) var numLikes: Int!
    private(set) var documentID: String!
    
    init(username: String, timestamp: Date, thoughtText: String, numComments: Int, numLikes: Int, documentID: String) {
        self.username = username
        self.timestamp = timestamp
        self.thoughtText = thoughtText
        self.numComments = numComments
        self.numLikes = numLikes
        self.documentID = documentID
    }
}
