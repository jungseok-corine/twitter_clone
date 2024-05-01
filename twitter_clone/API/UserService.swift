//
//  UserService.swift
//  twitter_clone
//
//  Created by 오정석 on 14/4/2024.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            guard let username = dictionary["username"] as? String else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
            
        }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        REF_USERS.observe(.childAdded) { snapshot in
            let uid = snapshot.key
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            users.append(user)
            completion(users)
        }
    }
    
    func followUser(uid: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        REF_USER_FOLLWING.child(currentUid).updateChildValues([uid:1]) { (err, ref) in
            REF_USER_FOLLWERS.child(uid).updateChildValues([currentUid: 1], withCompletionBlock: completion)
        }
            
        print("DEBUG: Current uid \(currentUid) started following")
        print("DEBUG: Uid \(uid) gained \(currentUid) as a follower")
    }
}
