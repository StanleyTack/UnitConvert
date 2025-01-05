//
//  ContentView.swift
//  UnitConvert
//
//  Created by Stanley Tack on 1/5/25.
//
// convert temp between c, f and K
// input number
// select starting unit
// select target unit
// display target temp


import SwiftUI

struct ContentView: View {
    @State private var startingTemp: Double = 0.0
    @State private var startingUnit: String = "Celsius"
    @State private var targetUnit: String = "Fahrenheit"
    @FocusState private var inputTempIsFocused: Bool
    
    enum units {
        case celsius, fahrenheit, kelvin
    }
    let unitsString = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertTemp: Double {
        let startingTemp = Double(startingTemp)
        
        switch startingUnit {
        case "Celsius":
            switch targetUnit {
            case "Celsius":
                let targetTemp = startingTemp
                return targetTemp
            case "Fahrenheit":
                let targetTemp = (startingTemp * 9 / 5) + 32
                return targetTemp
            case "Kelvin":
                let targetTemp = startingTemp + 273.15
                return targetTemp
            default:
                return 0
            }
        case "Fahrenheit":
            switch targetUnit {
            case "Celsius":
                let targetTemp = (startingTemp - 32) * 5 / 9
                return targetTemp
            case "Fahrenheit":
                let targetTemp = startingTemp
                return targetTemp
            case "Kelvin":
                let targetTemp = (startingTemp - 32) * 5 / 9 + 273.15
                return targetTemp
            default:
                return 0
            }
        case "Kelvin":
            switch targetUnit {
            case "Celsius":
                let targetTemp = startingTemp - 273.15
                return targetTemp
            case "Fahrenheit":
                let targetTemp = (startingTemp - 273.15) * 9 / 5 + 32
                return targetTemp
            case "Kelvin":
                let targetTemp = startingTemp
                return targetTemp
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Starting Temperature Unit", selection: $startingUnit) {
                        ForEach(unitsString, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    TextField("Temperature to convert", value: $startingTemp, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputTempIsFocused)
                }
                Section {
                    Picker("Convert to", selection: $targetUnit) {
                        ForEach(unitsString, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    Text(convertTemp, format: .number)
                }
            }
            .navigationTitle(Text("Unit Convertor"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if inputTempIsFocused {
                    Button("Done") {
                        inputTempIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
