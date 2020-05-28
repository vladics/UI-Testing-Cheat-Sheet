//
//  MainScreen.swift
//  VolleyUITests
//
//  Created by Сима Симович on 27.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

enum MainOption {
    case manageTeam
    case manageRoster
    case viewSchedule
    case moreInfoButton
}

class MainScreen: BaseScreen {
    private let manageTeamOption = app.tables.staticTexts["Manage Team"]
    private let manageRosterOption = app.tables.staticTexts["Manage Roster"]
    private let viewScheduleOption = app.tables.staticTexts["View Schedule"]
    private let moreInfoButton = app.buttons["More Info"]

    required init() {
        super.init()
        visible()
    }
    
    func optionTap(option: MainOption) {
        switch option {
        case .manageTeam:
            manageTeamOption.tap()
        case .manageRoster:
            manageRosterOption.tap()
        case .viewSchedule:
            viewScheduleOption.tap()
        case .moreInfoButton:
            moreInfoButton.tap()
        }
    }
}

extension MainScreen {
    private func visible() {
        guard manageTeamOption.waitForExistence(timeout: 5) else {
            XCTFail("Main Screen is not visible")
            return
        }
    }
}
