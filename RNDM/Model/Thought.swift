//
//  Thought.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/14/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import Foundation
import Firebase

class Thought {
    
    private(set) var username: String!
    private(set) var timestamp: Timestamp!
    private(set) var thoughtText: String!
    private(set) var numComments: Int!
    private(set) var numLikes: Int!
    private(set) var documentID: String!
    
    init(username: String, timestamp: Timestamp, thoughtText: String, numComments: Int, numLikes: Int, documentID: String) {
        self.username = username
        self.timestamp = timestamp
        self.thoughtText = thoughtText
        self.numComments = numComments
        self.numLikes = numLikes
        self.documentID = documentID
    }
    
    class func parseData(snapshot: QuerySnapshot?) -> [Thought] {
        var thoughtsArray = [Thought]()
        
        guard let snap = snapshot else { return thoughtsArray }
        for document in snap.documents {
            let data = document.data()
            
            let username = data[USERNAME] as? String ?? "Anonymous"
            let timestamp = data[TIMESTAMP] as? Timestamp ?? Timestamp()
            //let timestampDate = timestamp.dateValue() ?? Date()
            let thoughtText = data[THOUGHT_TEXT] as? String ?? ""
            let numLikes = data[NUM_LIKES] as? Int ?? 0
            let numComments = data[NUM_COMMENTS] as? Int ?? 0
            let documentID = document.documentID
            
            let newThought = Thought(username: username, timestamp: timestamp, thoughtText: thoughtText, numComments: numComments, numLikes: numLikes, documentID: documentID)
            thoughtsArray.append(newThought)
        }
        return thoughtsArray
    }
}
