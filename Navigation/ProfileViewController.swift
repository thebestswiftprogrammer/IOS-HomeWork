//  ProfileViewController.swift
//  Navigation
//
//  Created by Виктория Вайнштейн on 03.09.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    private let headerView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        view.backgroundColor = .lightGray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.frame
    }
}
