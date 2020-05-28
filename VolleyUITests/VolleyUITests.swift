//
//  VolleyUITests.swift
//  VolleyUITests
//
//  Created by Сима Симович on 27.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

class VolleyUITests: BaseTest {

    func testManageTeam() {
        let teamName = "Awesome"
        
        let mainScreen = MainScreen()
        mainScreen.optionTap(option: .manageTeam)
        let manageTeam = ManageTeamScreen()

        manageTeam.inputTeamName(text: teamName)
        XCTAssertEqual(manageTeam.valueTeamName(), teamName)
        
        XCTAssertTrue(manageTeam.defaultValueSkillLevel.exists)
        manageTeam.swipeSkillSliderToMax()
        XCTAssertTrue(manageTeam.newValueSkillLevel.exists)
        
        XCTAssertTrue(manageTeam.defaultValueFormation.exists)
        manageTeam.swipeUpWheels(option: .attackersWheel)
        manageTeam.swipeUpWheels(option: .settersWheel)
        XCTAssertTrue(manageTeam.newValueFormation.waitForExistence(timeout: 5))
    }
    
    func testManageRoster() {
        let mainScreen = MainScreen()
        mainScreen.optionTap(option: .manageRoster)
        let manageRoster = ManageRosterScreen()

        let lastDefaultPersonInList = manageRoster.lastPersonName
        manageRoster.pullLastPersonToFirst()
        XCTAssertEqual(manageRoster.firstPersonName, lastDefaultPersonInList)
        manageRoster.pullToRefresh(element: manageRoster.firstPersonField)
        XCTAssertTrue(manageRoster.dismissRefreshButton.waitForExistence(timeout: 5))
        manageRoster.tapDismissRefreshButton()
    }
    
    func testMoreInfo() {
        let mainScreen = MainScreen()
        mainScreen.optionTap(option: .moreInfoButton)
        let moreInfo = MoreInfoScreen()
        
        XCTAssertTrue(moreInfo.imagesVolley.count > 0)
        moreInfo.descriptionTap()
        XCTAssertTrue(moreInfo.descriptionTeamSport.waitForExistence(timeout: 5))
    }
    
    func testViewSchedule() {
        let mainScreen = MainScreen()
        mainScreen.optionTap(option: .viewSchedule)
        let viewSchedule = ViewScheduleScreen()
        
        viewSchedule.moreGamesTap()
        XCTAssertTrue(viewSchedule.newGameField.waitForExistence(timeout: 5))

        viewSchedule.finishGameTap()
        XCTAssertTrue(viewSchedule.youWonAwesomeButton.waitForExistence(timeout: 5))
        viewSchedule.youWonAwesomeTap()
    }
}
