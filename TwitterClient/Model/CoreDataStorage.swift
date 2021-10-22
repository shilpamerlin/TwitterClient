//
//  CoreDataStorage.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-21.
//

import UIKit
import CoreData

class CoreDataStorage: NSManagedObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tweet: [Tweet]?
    
    func saveTweetsToCoreData(name: String, tweetMessage: String, tweetTime: String) -> Tweet? {
        let newTweet = Tweet(context: self.context)
        newTweet.name = name
        newTweet.tweetMessage = tweetMessage
        newTweet.tweetTime = tweetTime
        do {
           try self.context.save()
            return newTweet
        }
        catch {
            print("Error ocuured while saving")
        }
        return nil
    }
    
    func fetchTweetsFromCoreData() -> [Tweet] {
        do {
            let request = Tweet.fetchRequest() as NSFetchRequest <Tweet>
            self.tweet = try context.fetch(request)
        } catch {
            print("Error retreiving data from Core Data")
        }
        tweet = tweet?.reversed()
        return tweet!
    }
    
    func fetchTweets(withMessage name: String) -> Tweet? {
        let fetchRequest = NSFetchRequest<Tweet>(entityName: "tweetMessage")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "tweetMessage == %@", name)
        
        do {
            let tweets = try context.fetch(fetchRequest)
            return tweets.first
        } catch let error {
            print("Failed to fetch: \(error)")
        }
        
        return nil
    }
}
