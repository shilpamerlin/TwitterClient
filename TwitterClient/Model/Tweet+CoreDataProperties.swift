//
//  Tweet+CoreDataProperties.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-21.
//
//

import Foundation
import CoreData


extension Tweet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tweet> {
        return NSFetchRequest<Tweet>(entityName: "Tweet")
    }

    @NSManaged public var name: String?
    @NSManaged public var tweetMessage: String?
    @NSManaged public var tweetTime: String?

}

extension Tweet : Identifiable {

}
