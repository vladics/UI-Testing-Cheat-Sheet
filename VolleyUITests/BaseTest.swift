//
//  BaseTest.swift
//  VolleyUITests
//
//  Created by Сима Симович on 27.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }
}
