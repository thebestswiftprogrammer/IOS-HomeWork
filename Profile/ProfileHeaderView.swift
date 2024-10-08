//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Виктория Вайнштейн on 21.09.2024.
//

import UIKit
class ProfileHeaderView: UIView {
    private let profileImage: UIImageView = {
        let img = UIImageView()
        img.layer.borderWidth = 3
        img.layer.borderColor = UIColor.white.cgColor
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 50
        img.clipsToBounds = true
        img.image = UIImage(resource: .superdog)
        return img
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Super dog"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for a walk"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let statusButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Playing with the ball", for: .normal)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 4
        btn.layer.shadowOffset = CGSize(width: 4, height: 4)
        btn.layer.shadowRadius = 4
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.7
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        statusButton.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(profileImage)
        addSubview(titleLabel)
        addSubview(profileImage)
        addSubview(statusLabel)
        addSubview(statusButton)

        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 56),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 56),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: 16),
            
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 34),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func onButtonTap() {
        print(statusLabel.text ?? "Nil")
    }
}
