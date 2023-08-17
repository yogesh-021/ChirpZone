//
//  Tweet.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 12/08/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLikeTweet: Bool? = false
}

