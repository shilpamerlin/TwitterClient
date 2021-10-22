//
//  TestCoreData.swift
//  TwitterClientTests
//
//  Created by Shilpa Joy on 2021-10-21.
//

import XCTest
@testable import TwitterClient
import CoreData

class CoreDataTests: XCTestCase {

    var sut: CoreDataStorage!
    var coreDataStack: CoreDataTestStack!
    override func setUpWithError() throws {
        super.setUp()
        sut = CoreDataStorage()
    }

    func testSaveAndFetchFeed() throws {
        sut?.saveTweetsToCoreData(name: "sample", tweetMessage: "sample case", tweetTime: "10/21/21, 11:48 PM")
        let tweet = sut?.fetchTweets(withMessage: "sample")
        XCTAssertEqual("sample case", tweet?.tweetMessage)
    }

}
