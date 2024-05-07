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
    
    private var notifications = [Notification]()
    
    // MARK: - Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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

extension NotificationController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationCell
        return cell
    }
}
