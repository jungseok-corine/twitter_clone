//
//  ActionSheetLauncher.swift
//  twitter_clone
//
//  Created by 오정석 on 6/5/2024.
//

import UIKit

class ActionSheetLauncher: NSObject {
    
    // MARK: - Properties
    
    private let user: User

    init(user: User) {
        self.user = user
        super.init()
    }
    
    // MARK: - Helpers
    
    func show() {
        print("DEBUG: Show action sheet for user \(user.username)")
    }
}
