//
//  TweetCell.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-20.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var tweet: Tweet? {
        didSet { configureCell() }
    }
    private let profileImageview: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profile")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some test caption"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private var nameLabel = UILabel()
    private var tweetDataLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(profileImageview)
        profileImageview.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 12, paddingLeft: 8)
        let stack = UIStackView(arrangedSubviews: [nameLabel, captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        addSubview(stack)
        stack.anchor(top: profileImageview.topAnchor, left: profileImageview.rightAnchor,
                     right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)

        let underLineView = UIView()
        underLineView.backgroundColor = .systemGroupedBackground
        addSubview(underLineView)
        underLineView.anchor(left: leftAnchor, bottom: bottomAnchor,
                             right: rightAnchor, height: 1)
        
        tweetDataLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(tweetDataLabel)
        tweetDataLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 12, paddingRight: 12)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }

    // MARK: - Helpers
    
    func configureCell() {
        guard let tweet = tweet else { return }
        nameLabel.text = tweet.name
        captionLabel.text = tweet.tweetMessage
        tweetDataLabel.text = tweet.tweetTime
    }
}
