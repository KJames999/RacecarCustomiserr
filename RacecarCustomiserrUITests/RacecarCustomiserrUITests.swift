//
//  RacecarCustomiserrUITests.swift
//  RacecarCustomiserrUITests
//
//  Created by James, Killian (NA) on 17/01/2022.
//

import XCTest

class RacecarCustomiserrUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testWhenBoughtTiresAndExhaustPackageOtherTwoUpgradesAreDisabled() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = XCUIApplication().tables
                tablesQuery.switches["Exhaust Package (Cost: 500)"].tap()
        tablesQuery.switches["Tires Package (Cost: 500)"].tap()
        
        XCTAssertEqual(tablesQuery.switches["NOS Package (Cost: 500)"].isEnabled, false)
                XCTAssertEqual(tablesQuery.switches["Feather Package (Cost: 500)"].isEnabled, false)
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
