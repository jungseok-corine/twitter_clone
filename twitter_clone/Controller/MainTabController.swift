//
//  MainTabController.swift
//  twitter_clone
//
//  Created by 오정석 on 27/3/2024.
//

import UIKit

class MainTabController: UITabBarController {

    // MARK: - Properties
    
    // MARK: - Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        configureViewControllers()
    }
  
    // MARK: - Helpers
    
    
    func configureViewControllers() {
        
        let feed = FeedController()
        feed.tabBarItem.image = UIImage(named: "home_unselected")
        
        let explore = ExploreController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")
        
        let notifications = NotificationController()
        notifications.tabBarItem.image = UIImage(named: "like_unselected")
        
        let conversations = ConversationsController()
        conversations.tabBarItem.image = UIImage(named: "like_unselected")
        
        
        viewControllers = [feed, explore, notifications, conversations]
    }


}
