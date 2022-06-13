//
//  ContentView.swift
//  [220613] swift_day_19
//
//  Created by user on 2022/06/12.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit: String = "centimeters"
    @State private var outputUnit: String = "centimeters"
    @State private var userInput: Double = 0
    
    var convertedValue: String {
        var inputValue = Measurement(value: 0, unit: UnitLength.centimeters)
        var outputValue = Measurement(value: 0, unit: UnitLength.centimeters)
        
        switch(inputUnit) {
        case "centimeters" : inputValue = Measurement(value: Double(userInput), unit: UnitLength.centimeters)
        case "meters" : inputValue = Measurement(value: Double(userInput), unit: UnitLength.meters)
        case "kilometers" : inputValue = Measurement(value: Double(userInput), unit: UnitLength.kilometers)
        case "inches" : inputValue = Measurement(value: Double(userInput), unit: UnitLength.inches)
        case "feet" : inputValue = Measurement(value: Double(userInput), unit: UnitLength.feet)
        case "yards" : inputValue = Measurement(value: Double(userInput), unit: UnitLength.yards)
        case "miles" : inputValue = Measurement(value: Double(userInput), unit: UnitLength.miles)
        default : inputValue = Measurement(value: Double(0), unit: UnitLength.centimeters)
        }
        
        
        switch(outputUnit) {
        case "centimeters": outputValue = inputValue.converted(to: UnitLength.centimeters)
        case "meters" : outputValue = inputValue.converted(to: UnitLength.meters)
        case "kilometers" : outputValue = inputValue.converted(to: UnitLength.kilometers)
        case "inches" : outputValue = inputValue.converted(to: UnitLength.inches)
        case "feet" : outputValue = inputValue.converted(to: UnitLength.feet)
        case "yards" : outputValue = inputValue.converted(to: UnitLength.yards)
        case "miles" : outputValue = inputValue.converted(to: UnitLength.miles)
        default: outputValue = Measurement(value: 0, unit: UnitLength.centimeters)
        }
        
        return String(describing: outputValue)
    }
    
    let inputUnits = ["centimeters","meters", "kilometers", "inches" ,"feet", "yards", "miles"]
    let outputUnits = ["centimeters","meters", "kilometers", "inches", "feet", "yards", "miles"]
    var body: some View {
        NavigationView {
            Form {
                Section { // input unit selection
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                } header: {
                    Text("Choose Input Unit")
                }
                
                Section { // output unit selection
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(outputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                } header: {
                    Text("Choose Output Unit")
                }
                
                Section {
                    TextField("Number?", value: $userInput, format: .number)
                } header: {
                    Text("Enter a number")
                }
                
                Section {
//                    Text("\(inputUnit) to \(outputUnit)")
                    Text("\(convertedValue)")
                } header: {
//                    Text("Converted number")
                    Text("\(inputUnit) to \(outputUnit)")
                }
                
            }
            .navigationTitle("Length converting app")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
