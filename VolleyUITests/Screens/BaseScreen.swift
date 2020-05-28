//
//  BaseScreen.swift
//  VolleyUITests
//
//  Created by Сима Симович on 27.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

class BaseScreen {
    static let app = XCUIApplication()

    required init() { }

    func pullToRefresh(element: XCUIElement) {
        let coordinate = element.coordinate(withNormalizedOffset: CGVector())
        let bottom = element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 25))
        coordinate.press(forDuration: 1, thenDragTo: bottom)
    }
}
