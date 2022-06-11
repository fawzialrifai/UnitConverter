//
//  LengthConverter.swift
//  UnitConverter
//
//  Created by Fawzi Rifai on 11/06/2022.
//

import SwiftUI

struct LengthConverter: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = Length.meter
    @State private var outputUnit = Length.kilometer
    private var outputValue: Double {
        var lengthInMeter = 0.0
        switch inputUnit {
        case .meter:
            lengthInMeter = inputValue
        case .kilometer:
            lengthInMeter = inputValue * 1000
        case .foot:
            lengthInMeter = inputValue / 3.281
        case .yard:
            lengthInMeter = inputValue / 1.094
        case .mile:
            lengthInMeter = inputValue * 1609
        }
        switch outputUnit {
        case .meter:
            return lengthInMeter
        case .kilometer:
            return lengthInMeter / 1000
        case .foot:
            return lengthInMeter * 3.281
        case .yard:
            return lengthInMeter * 1.094
        case .mile:
            return lengthInMeter / 1609
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
                ForEach(Length.allCases) { value in
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
                ForEach(Length.allCases) { value in
                    Text(value.abbreviation)
                        .tag(value)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct LengthSections_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            LengthConverter()
        }
    }
}
