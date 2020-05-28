//
//  ViewScheduleScreen.swift
//  VolleyUITests
//
//  Created by Сима Симович on 28.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

class ViewScheduleScreen: BaseScreen {
    private let moreGamesButton = app.staticTexts["Load More Games"]
    private let finishGameButton = app.buttons["Finish Game"]
    let newGameField = app.staticTexts["Game 4 - Tomorrow"]
    let youWonAwesomeButton = app.alerts["You won!"].buttons["Awesome!"]

    required init() {
        super.init()
        visible()
    }

    func moreGamesTap() {
        moreGamesButton.tap()
    }

    func finishGameTap() {
        finishGameButton.tap()
    }

    func youWonAwesomeTap() {
        youWonAwesomeButton.tap()
    }
}

extension ViewScheduleScreen {
    private func visible() {
        guard moreGamesButton.waitForExistence(timeout: 5) else {
            XCTFail("View Schedule Screen is not visible")
            return
        }
    }
}
