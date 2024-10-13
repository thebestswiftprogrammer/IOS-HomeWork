
//  AlertViewController.swift
//  Navigation

//  Created by Виктория Вайнштейн on 13.10.2024.


import UIKit

struct Alert{
    let title: String
}

class AlertController: UIAlertController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .purple
    }
}
