//
//  ContentView.swift
//  UnitConverter
//
//  Created by Fawzi Rifai on 11/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var measurementType = MeasurementType.temperature
    @FocusState private var isInputTemperatureFocused: Bool
    var body: some View {
        NavigationView {
            Form {
                Section("What do you want to convert?") {
                    Picker("Measurement Type", selection: $measurementType) {
                        ForEach(MeasurementType.allCases) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                }
                switch measurementType {
                case .temperature:
                    TemperatureConverter(isInputValueFocused: _isInputTemperatureFocused)
                case .length:
                    LengthConverter(isInputValueFocused: _isInputTemperatureFocused)
                case .time:
                    TimeConverter(isInputValueFocused: _isInputTemperatureFocused)
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputTemperatureFocused = false
                    }
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
