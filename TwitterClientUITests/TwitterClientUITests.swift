//
//  TwitterClientUITests.swift
//  TwitterClientUITests
//
//  Created by Shilpa Joy on 2021-10-20.
//

import XCTest

class TwitterClientUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLoginSuccess() {
        
        let validUsername = "shilpa@mail.com"
        let validPassword = "1234"
        
        let app = XCUIApplication()
        app.launch()
        let usernameTextField = app.textFields["Email"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validUsername)
            
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
    
        app.buttons["Log In"].tap()
    }
    
    func testInvalidLogin_missingCredentialsAlertIsshown() {
        
        let app = XCUIApplication()
        app.launch()
        app.textFields["Email"].tap()
        app.secureTextFields["Password"].tap()
        app.buttons["Log In"].tap()
        
        let alertDialog = app.alerts["Invalid Username or Password"]
        XCTAssertTrue(alertDialog.exists)
        alertDialog.buttons["OK"].tap()
        
    }
    
    func testInvalidLogin() {
        let InvalidUsername = "shilpa@mail.com"
        let InvalidPassword = "invalidpassword"
        
        let app = XCUIApplication()
        app.launch()
        
        let usernameTextField = app.textFields["Email"]
        usernameTextField.tap()
        usernameTextField.typeText(InvalidUsername)
            
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(InvalidPassword)
    
   
        app.buttons["Log In"].tap()
        app.alerts["Invalid Username or Password"].scrollViews.otherElements.buttons["OK"].tap()
        
    }
    
    override func tearDownWithError() throws {
    }

    func testPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
