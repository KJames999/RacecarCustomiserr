//
//  ContentView.swift
//  RacecarCustomiserr
//
//  Created by James, Killian (NA) on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    let car = RaceCar(brand: "Ferrari", model: "911", acceleration: 100.0, handling: 10, topSpeed: 300)
    var body: some View {
        Text(car.getDetails())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
