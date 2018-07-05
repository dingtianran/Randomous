//
//  RandomousUITests.swift
//  RandomousUITests
//
//  Created by Tianran Ding on 5/07/18.
//  Copyright © 2018 TDing. All rights reserved.
//

import XCTest

class RandomousUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSelectUserAndDetail() {
        
        
    }
    
}
