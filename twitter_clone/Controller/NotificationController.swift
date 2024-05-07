//
//  NotificationController.swift
//  twitter_clone
//
//  Created by 오정석 on 27/3/2024.
//

import UIKit

private let reuseIdentifier = "NotificationCell"

class NotificationController: UITableViewController {
    
    // MARK: - Properties
    
    private var notifications = [Notification]() {
        didSet { tableView.reloadData() }
    }
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .default
    }
    
    // MARK: - API
    
    func fetchNotifications() {
        NotificationService.shared.fetchNotifications { notifications in
            self.notifications = notifications
            
            for (index, notification) in notifications.enumerated() {
                if case .follow = notification.type {
                    let user = notification.user
                    
                    UserService.shared.checkIfUserIsFollwed(uid: user.uid) { isFollwed in
                        self.notifications[index].user.isFollowed = isFollwed
                    }
                }
            }
        }
    }

// MARK: - Helpers
func configureUI() {
    view.backgroundColor = .white
    navigationItem.title = "Notifications"
    
    tableView.register(NotificationCell.self, forCellReuseIdentifier: reuseIdentifier)
    tableView.rowHeight = 60
    tableView.separatorStyle = .none
}
}

// MARK: - UITableViewDatasource

extension NotificationController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationCell
        cell.notification = notifications[indexPath.row]
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate

extension NotificationController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notification = notifications[indexPath.row]
        guard let tweetID = notification.tweetID else { return }
        
        TweetService.shared.fetchTweet(withTweetID: tweetID) { tweet in
            let controller = TweetController(tweet: tweet)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

// MARK: - NotificationCellDelegate

extension NotificationController: NotificationCellDelegate {
    func didTapFollow(_ cell: NotificationCell) {
        print("DEBUG: Handle follow tap...")
    }
    
    func didTapProfileImage(_ cell: NotificationCell) {
        guard let user = cell.notification?.user else { return }
        
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
}
