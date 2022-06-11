//
//  TemperatureConverter.swift
//  UnitConverter
//
//  Created by Fawzi Rifai on 11/06/2022.
//

import SwiftUI

struct TemperatureConverter: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = Temperature.celsius
    @State private var outputUnit = Temperature.fahrenheit
    private var outputValue: Double {
        var temperatureInCelsius = 0.0
        switch inputUnit {
        case .celsius:
            temperatureInCelsius = inputValue
        case .fahrenheit:
            temperatureInCelsius = (inputValue - 32) * 5 / 9
        case .kelvin:
            temperatureInCelsius = inputValue - 273.15
        }
        switch outputUnit {
        case .celsius:
            return temperatureInCelsius
        case .fahrenheit:
            return (temperatureInCelsius * 9 / 5) + 32
        case .kelvin:
            return temperatureInCelsius + 273.15
        }
    }
    @FocusState var isInputValueFocused: Bool
    var body: some View {
        Section("Input") {
            HStack {
                TextField("Input", value: $inputValue, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($isInputValueFocused)
                Text(inputUnit.rawValue)
            }
            Picker("", selection: $inputUnit) {
                ForEach(Temperature.allCases) { value in
                    Text(value.abbreviation)
                        .tag(value)
                }
            }
            .pickerStyle(.segmented)
        }
        Section("Output") {
            HStack {
                Text(outputValue.formatted())
                    .textSelection(.enabled)
                Spacer()
                Text(outputUnit.rawValue)
            }
            Picker("", selection: $outputUnit) {
                ForEach(Temperature.allCases) { value in
                    Text(value.abbreviation)
                        .tag(value)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct TemperatureSections_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TemperatureConverter()
        }
    }
}
