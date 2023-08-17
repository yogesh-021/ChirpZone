//
//  User.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 11/08/23.


import FirebaseFirestoreSwift
import Firebase
import FirebaseAuth

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
}

