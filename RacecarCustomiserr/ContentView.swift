//
//  ContentView.swift
//  RacecarCustomiserr
//
//  Created by James, Killian (NA) on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var nosPackage = false
    @State private var featherPackage = false
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].topSpeed += 5
                } else {
                    starterCars.car[selectedCar].topSpeed -= 5
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get : { self.tiresPackage },
            set : { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].handling += 2
                } else {
                    starterCars.car[selectedCar].handling -= 2
                }
            }

        )
        
        let nosPackageBinding = Binding<Bool> (
            get : { self.nosPackage },
            set : { newValue in
                self.nosPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].acceleration += 50
                } else {
                    starterCars.car[selectedCar].acceleration -= 50
                }
            }

        )
        
        let featherPackageBinding = Binding<Bool> (
            get : { self.featherPackage },
            set : { newValue in
                self.featherPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].topSpeed += 10
                } else {
                    starterCars.car[selectedCar].topSpeed -= 10
                }
            }

        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text(starterCars.car[selectedCar].getDetails())
                Button("Random Car", action: {
                    selectedCar = Int.random(in: 0 ..< self.starterCars.car.count)
                })
                Button("Next Car", action: {
                    if selectedCar == 3 {
                        selectedCar = 0
                    } else {
                        selectedCar += 1
                    }
                })
                Section {
                    Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                    Toggle("Tires Package", isOn: tiresPackageBinding)
                    Toggle("NOS", isOn: nosPackageBinding)
                    Toggle("Feather", isOn: featherPackageBinding)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
