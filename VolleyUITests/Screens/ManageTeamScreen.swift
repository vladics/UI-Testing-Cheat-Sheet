//
//  ManageTeamScreen.swift
//  VolleyUITests
//
//  Created by Сима Симович on 27.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

enum WheelOption {
    case attackersWheel
    case settersWheel
}

class ManageTeamScreen: BaseScreen {
    private let teamNameField = app.textFields["Team Name"]
    private let skillSlider = app.sliders.element(boundBy: 0)
    private let attackersWheel = app.pickerWheels["Attackers Formation"]
    private let settersWheel = app.pickerWheels["Setters Formation"]
    let defaultValueFormation = app.staticTexts["4 attackers, 2 setters"]
    let newValueFormation = app.staticTexts["6 attackers, 1 setter"]
    let defaultValueSkillLevel = app.staticTexts["3"]
    let newValueSkillLevel = app.staticTexts["10"]

    required init() {
        super.init()
        visible()
    }

    func inputTeamName(text: String) {
        teamNameField.tap()
        teamNameField.typeText(text)
        teamNameField.typeText(XCUIKeyboardKey.return.rawValue)
    }
    
    func valueTeamName() -> String {
        return teamNameField.value as! String
    }
    
    func swipeSkillSliderToMax() {
        skillSlider.adjust(toNormalizedSliderPosition: 1)
    }
    
    func swipeUpWheels(option: WheelOption) {
        switch option {
        case .attackersWheel:
            attackersWheel.swipeUp()
        case .settersWheel:
            settersWheel.swipeUp()
        }
    }
}

extension ManageTeamScreen {
    private func visible() {
        guard teamNameField.waitForExistence(timeout: 5) else {
            XCTFail("Manage Team Screen is not visible")
            return
        }
    }
}
