//
//  UploadTweetController.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-21.
//

import Foundation
import UIKit

class UploadTweetController: UIViewController {
    
    // MARK: - Properties
    
    var feedViewModel = FeedViewModel()
    private lazy var tweetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .twitterBlue
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font  = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        
        button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)
        return button
        
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.image = UIImage(named: "profile")
        return iv
    }()
    
    private let captionTextView = CaptionTextView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, captionTextView])
        stack.axis = .horizontal
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,
                     right:view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
    }
        
    func configureNavigationBar() {
        //navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.barTintColor = UIColor.white
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                            target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: tweetButton)
    }
    
    // MARK: - Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleUploadTweet() {
        guard let caption = captionTextView.text else { return }
        let currentDataTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        let dateTimeString = formatter.string(from: currentDataTime)
        print(dateTimeString)
        
       feedViewModel.saveTweets(name: "Shilpa Joy @Lorem", tweetMessage: caption, tweetTime: dateTimeString)
        dismiss(animated: true, completion: nil)
        //feedViewModel.fetchTweets()
    }
    
}
