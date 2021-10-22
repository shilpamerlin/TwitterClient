//
//  TwitterClientTests.swift
//  TwitterClientTests
//
//  Created by Shilpa Joy on 2021-10-20.
//

import XCTest
@testable import TwitterClient

class LoginTests: XCTestCase {

    var sut: LoginViewModel!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LoginViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testLogin() throws {
        XCTAssertTrue(sut.sendValue(from: "shilpa@mail.com", passwordTextField: "1234"))
        XCTAssertFalse(sut.sendValue(from: "test", passwordTextField: "123"))
        
    }

}
