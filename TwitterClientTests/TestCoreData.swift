//
//  TestCoreData.swift
//  TwitterClientTests
//
//  Created by Shilpa Joy on 2021-10-21.
//

import XCTest
@testable import TwitterClient
import CoreData

class TestCoreData: XCTestCase {

    var sut: CoreDataStorage?
    var coreDataStack: CoreDataTestStack!
    override func setUpWithError() throws {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        sut = CoreDataStorage(context: coreDataStack.mainContext)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchFeed() throws {
        var s = sut?.saveTweetsToCoreData(name: "Test", tweetMessage: "Test tweet", tweetTime: "10/21/21, 11:48 PM")
        print("tweet is ********** \(s?.tweetMessage)")
        
        let tweet = sut?.fetchTweets(withMessage: "Test")
        print("tweet is $$$$$$$$ \(tweet)")
        XCTAssertEqual("Test", tweet?.tweetMessage)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
