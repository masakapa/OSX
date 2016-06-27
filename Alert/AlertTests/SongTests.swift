//
//  SongTests.swift
//  Alert
//
//  Created by AlphaTest on 16/6/27.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import XCTest
@testable import Alert

class SongTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let song = Song(title: Constants.title, author: Constants.author, duration: Constants.duration)
        
        XCTAssertEqual(song.title, Constants.title)
        XCTAssertEqual(song.author, Constants.author)
        XCTAssertEqual(song.duration, Constants.duration)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
