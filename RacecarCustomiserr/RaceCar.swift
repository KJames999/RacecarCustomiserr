//
//  RaceCar.swift
//  RacecarCustomiserr
//
//  Created by James, Killian (NA) on 17/01/2022.
//

import Foundation
struct RaceCar {
    let brand: String
    let model: String
    var acceleration: Double
    var handling: Int
    var topSpeed: Int
    
    func getDetails() -> String {
        return """
        Make: \(self.brand)
        Model: \(self.model)
        Top Speed: \(self.topSpeed)
        Acceleration: \(self.acceleration)
        Handling: \(self.handling)
        """
    }
    
}
