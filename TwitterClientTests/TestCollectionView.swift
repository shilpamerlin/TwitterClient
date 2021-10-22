//
//  TestCollectionView.swift
//  TwitterClientTests
//
//  Created by Shilpa Joy on 2021-10-22.
//

import XCTest
@testable import TwitterClient

class TestCollectionView: XCTestCase {

    var sut: FeedController!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FeedController()
    }
    func testFeedCollectionView() {
        XCTAssertNotNil(sut.collectionView)
    }

}
