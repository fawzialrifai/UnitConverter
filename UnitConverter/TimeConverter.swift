//
//  TimeConverter.swift
//  UnitConverter
//
//  Created by Fawzi Rifai on 11/06/2022.
//

import SwiftUI

struct TimeConverter: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = Time.second
    @State private var outputUnit = Time.minute
    private var outputValue: Double {
        var timeInSeconds = 0.0
        switch inputUnit {
        case .second:
            timeInSeconds = inputValue
        case .minute:
            timeInSeconds = inputValue * 60
        case .hour:
            timeInSeconds = inputValue * 3600
        case .day:
            timeInSeconds = inputValue * 86400
        }
        switch outputUnit {
        case .second:
            return timeInSeconds
        case .minute:
            return timeInSeconds / 60
        case .hour:
            return timeInSeconds / 3600
        case .day:
            return timeInSeconds / 86400
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
                ForEach(Time.allCases) { value in
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
                ForEach(Time.allCases) { value in
                    Text(value.abbreviation)
                        .tag(value)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct TimeSections_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TimeConverter()
        }
    }
}
