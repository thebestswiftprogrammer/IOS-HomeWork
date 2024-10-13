//
// ViewController.swift
//  Navigation
//
//  Created by Виктория Вайнштейн on 03.09.2024.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
import UIKit

struct Post {
    let title: String
}

class PostViewController: UIViewController {
    var post: Post
    
    private var button: UIButton = {
        let infoButton = UIButton(type: .system)
        infoButton.setTitle("Info", for: .normal)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        
        return infoButton
    }()
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = post.title
        
        let barButtonItem = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: self,
            action: #selector(showInfo)
        )
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func showInfo() {
        let info = Info(title: "Info")
        let infoVC = InfoViewController(info: info)
        navigationController?.present(infoVC, animated: true, completion: nil)
    }
}

// FeedViewController.swift
//  Navigation
//
//  Created by Виктория Вайнштейн on 03.09.2024.
//

import UIKit

class FeedViewController: UIViewController {
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open Post 1", for: .normal)
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open Post 2", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        firstButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        view.addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showPost() {
        let post = Post(title: "New Post")
        let postVC = PostViewController(post: post)
        navigationController?.pushViewController(postVC, animated: true)
    }
}
