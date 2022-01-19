//
//  RacecarCustomiserrTests.swift
//  RacecarCustomiserrTests
//
//  Created by James, Killian (NA) on 17/01/2022.
//

import XCTest

class RacecarCustomiserrTests: XCTestCase {

    func testCarWithNewCorrectStats() {
        let car = Car(brand: "Ferrari", model: "911", acceleration: 100.0, handling: 10, topSpeed: 300)
        XCTAssertEqual(car.brand, "Ferrari")
        XCTAssertEqual(car.model, "911")
        XCTAssertEqual(car.acceleration, 100.0)
        XCTAssertEqual(car.handling, 10)
        XCTAssertEqual(car.topSpeed, 300)
    }
    
    func testCarCorrectlyReturnDetails() {
        let car = Car(brand: "Ferrari", model: "911", acceleration: 100.0, handling: 10, topSpeed: 300)
        let actual = car.getDetails()
        let expected = """
            Make: Ferrari
            Model: 911
            Top Speed: 300
            Acceleration: 100.0
            Handling: 10
            """
        XCTAssertEqual(actual, expected)

    }
}
