//
//  NotificationService.swift
//  twitter_clone
//
//  Created by 오정석 on 7/5/2024.
//

import Firebase

struct NotificationService {
    static let shared = NotificationService()
    
    func uploadeNotification(type: NotificationType,
                             tweet: Tweet? = nil,
                             user: User? = nil) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
                
        var values: [String: Any] = ["timestamp": Int(NSDate().timeIntervalSince1970), 
                                     "uid": uid,
                                     "type": type.rawValue]
        
        if let tweet = tweet {
            values["tweetID"] = tweet.tweetID
            REF_NOTIFICATIONS.child(tweet.user.uid).childByAutoId().updateChildValues(values)
        } else if let user = user {
            REF_NOTIFICATIONS.child(user.uid).childByAutoId().updateChildValues(values)
        }
    }
}
