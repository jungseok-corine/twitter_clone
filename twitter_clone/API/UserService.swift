//
//  UserService.swift
//  twitter_clone
//
//  Created by 오정석 on 14/4/2024.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            print("DEBUG: Snapshot is \(snapshot)")
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            print("DEBUG: Dictionary is \(dictionary)")
            
            guard let username = dictionary["username"] as? String else { return }
            print("DEBUG: Username is \(username)")
        }
    }
}
