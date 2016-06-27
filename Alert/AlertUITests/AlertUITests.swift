//
//  AlertUITests.swift
//  AlertUITests
//
//  Created by AlphaTest on 16/6/27.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import XCTest

class AlertUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let window = XCUIApplication().windows["Window"]
        let alertButton = window.buttons["Alert"]
        alertButton.click()
        
        let alertSheet = window.sheets["alert"]
        alertSheet.buttons["好吧"].click()
        alertButton.click()
        alertSheet.buttons["知道了"].click()
        alertButton.click()
        alertSheet.buttons["Defult"].click()
        
        
        XCTAssert(window.staticTexts["1000"].exists)
    }
    
}
