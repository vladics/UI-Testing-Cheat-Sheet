//
//  ManageRosterScreen.swift
//  VolleyUITests
//
//  Created by Сима Симович on 27.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

class ManageRosterScreen: BaseScreen {
    private let reorderPersonButtons = app.tables.buttons
    let firstPersonField = app.tables.staticTexts.firstMatch
    let dismissRefreshButton = app.alerts["Roster Refreshed"].buttons["Dismiss"]

    private var countPerson: Int {
        return reorderPersonButtons.count
    }
    var firstPersonName: String {
        return reorderPersonButtons.firstMatch.label
    }
    var lastPersonName: String {
        return reorderPersonButtons.element(boundBy: countPerson-1).label
    }

    required init() {
        super.init()
        visible()
    }

    func pullLastPersonToFirst() {
        reorderPersonButtons.element(boundBy: countPerson-1)
            .press(forDuration: 1, thenDragTo: reorderPersonButtons.firstMatch)
    }

    func tapDismissRefreshButton() {
        dismissRefreshButton.tap()
    }

}

extension ManageRosterScreen {
    private func visible() {
        guard firstPersonField.waitForExistence(timeout: 5) else {
            XCTFail("Manage Roster Screen is not visible")
            return
        }
    }
}
