//
//  User.swift
//  twitter_clone
//
//  Created by 오정석 on 14/4/2024.
//

import UIKit
import Firebase

struct User {
    var fullname: String
    let email: String
    var username: String
    var profileImageUrl: URL?
    let uid: String
    var isFollowed = false
    var stats: UserRelationStats?
    var bio: String?
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""

        if let bio = dictionary["bio"] as? String {
            self.bio = bio
        }
        
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
}

struct UserRelationStats {
    var followers: Int
    var following: Int
}
