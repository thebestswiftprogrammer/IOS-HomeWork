// FeedViewController.swift
//  Navigation
//
//  Created by Виктория Вайнштейн on 03.09.2024.
//

import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        let postButton = UIButton (type: .system)
        postButton.setTitle("Post", for: .normal)
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
        postButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showPost () {
        let post = Post(title: "New post")
        let postVC = PostViewController(post: post)
        navigationController?.pushViewController(postVC, animated: true)
    }
}
