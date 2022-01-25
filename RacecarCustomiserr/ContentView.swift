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
    @State private var remainingFunds = 1000
    @State private var remainingTime = 30

    var timerDone: Bool{
        if self.remainingTime == 0{
            return false
        }else{
            return true
        }
    }
    
    var exhaustPackageEnabled: Bool{
        return timerDone ? (exhaustPackage ? true : remainingFunds >= 500 ? true : false) : false
    }
    var tiresPackageEnabled: Bool{
        return timerDone ? (tiresPackage ? true : remainingFunds >= 500 ? true : false) : false
    }
    var nosPackageEnabled: Bool{
        return timerDone ? (nosPackage ? true : remainingFunds >= 500 ? true : false) : false
    }
    var featherPackageEnabled: Bool{
        return timerDone ? (featherPackage ? true : remainingFunds == 1000 ? true : false) : false
    }

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.car[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get : { self.tiresPackage },
            set : { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.car[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }

        )
        
        let nosPackageBinding = Binding<Bool> (
            get : { self.nosPackage },
            set : { newValue in
                self.nosPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].acceleration += 50
                    remainingFunds -= 500
                } else {
                    starterCars.car[selectedCar].acceleration -= 50
                    remainingFunds += 500
                }
            }

        )
        
        let featherPackageBinding = Binding<Bool> (
            get : { self.featherPackage },
            set : { newValue in
                self.featherPackage = newValue
                if newValue == true {
                    starterCars.car[selectedCar].topSpeed += 10
                    remainingFunds -= 500
                } else {
                    starterCars.car[selectedCar].topSpeed -= 10
                    remainingFunds += 500
                }
            }

        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(remainingTime)")
                .onReceive(timer, perform: { _ in
                    if self.remainingTime > 0{
                        self.remainingTime -= 1
                    }
                })
                Text(starterCars.car[selectedCar].getDetails())
                Button("Random Car", action: {
                    selectedCar = Int.random(in: 0 ..< self.starterCars.car.count)
                    resetDisplay()
                })
                Button("Next Car", action: {
                    if selectedCar == 3 {
                        selectedCar = 0
                    } else {
                        selectedCar += 1
                    }
                    resetDisplay()
                })
                .disabled(!timerDone)
                Section {
                    Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("NOS", isOn: nosPackageBinding)
                        .disabled(!nosPackageEnabled)
                    Toggle("Feather", isOn: featherPackageBinding)
                        .disabled(!featherPackageEnabled)
                }
            }
            Text("remainingFunds: \(remainingFunds)")
                .foregroundColor(.red)
            }
        }
        
        
    func resetDisplay() {
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        nosPackage = false
        featherPackage = false
        starterCars = StarterCars()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
