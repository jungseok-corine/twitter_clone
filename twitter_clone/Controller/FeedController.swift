//
//  FeedController.swift
//  twitter_clone
//
//  Created by 오정석 on 27/3/2024.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
  
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
