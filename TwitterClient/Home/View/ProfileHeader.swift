//
//  ProfileHeader.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-21.
//

import Foundation
import UIKit

protocol ProfileHeaderDelegate {
    func handleDismissal()
}

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    var delegate: ProfileHeaderDelegate?
    private lazy var containerView: UIView = {
        let view =  UIView()
        view.backgroundColor = .twitterBlue
        view.addSubview(logoutButton)
        logoutButton.anchor(top: view.topAnchor, right: view.rightAnchor,
                          paddingTop: 42, paddingRight: 16)
        logoutButton.setDimensions(width: 70, height: 35)
        return view
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font  = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4
        iv.image = UIImage(named: "profile")
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shilpa Joy"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@hello"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.text = "This is my bio section where you can get an idea of who I am !!"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Tweets"
        label.textColor = .twitterBlue
        return label
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor,
                             right: rightAnchor, height: 108)
        addSubview(profileImageView)
        profileImageView.anchor(top: containerView.bottomAnchor,left: leftAnchor,
                                paddingTop: -24,paddingLeft: 8)
        profileImageView.setDimensions(width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        let userDetailsStack = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, bioLabel])
        userDetailsStack.axis = .vertical
        userDetailsStack.distribution = .fillProportionally
        userDetailsStack.spacing = 4
        
        addSubview(userDetailsStack)
        userDetailsStack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,
                                right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        addSubview(titleLabel)
        titleLabel.anchor(top: userDetailsStack.bottomAnchor, left: leftAnchor,right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingRight: 12)
        
        addSubview(underLineView)
        underLineView.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width, height: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
}
