//
//  FeedViewModel.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-21.
//

import Foundation

protocol FeedViewModelDelegate {
    func saveTweets(name: String?, tweetMessage: String?, tweetTime: String?)
}

class FeedViewModel: FeedViewModelDelegate {
   

    // MARK: - Properties
    
    var coreDataObj = CoreDataStorage()
    
    // MARK: - FeedViewModelDelegate
    
    func saveTweets(name: String?, tweetMessage: String?, tweetTime: String?) {
        guard let name = name else { return }
        guard let tweetMessage = tweetMessage else { return }
        guard let tweetTime = tweetTime else { return }
        coreDataObj.saveTweetsToCoreData(name: name, tweetMessage: tweetMessage, tweetTime: tweetTime)
    }
    
    func fetchTweets() -> [Tweet] {
        let retrievedData = coreDataObj.fetchTweetsFromCoreData()
        return retrievedData
    }
}
