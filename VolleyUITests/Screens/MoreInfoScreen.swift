//
//  MoreInfoScreen.swift
//  VolleyUITests
//
//  Created by Сима Симович on 28.05.2020.
//  Copyright © 2020 Masilotti.com. All rights reserved.
//

import XCTest

class MoreInfoScreen: BaseScreen {
    private let descriptionVolley = app.links["team sport"]
    let descriptionTeamSport = app.staticTexts["Team sport"]
    let imagesVolley = app.images

    required init() {
        super.init()
        visible()
    }

    func descriptionTap() {
        descriptionVolley.tap()
    }
}

extension MoreInfoScreen {
    private func visible() {
        guard descriptionVolley.waitForExistence(timeout: 5) else {
            XCTFail("More Info Screen is not visible")
            return
        }
    }
}
