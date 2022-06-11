//
//  UnitConverterApp.swift
//  UnitConverter
//
//  Created by Fawzi Rifai on 11/06/2022.
//

import SwiftUI

@main
struct UnitConverterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

enum MeasurementType: String, Identifiable, CaseIterable {
    case temperature = "Temperature"
    case length = "Length"
    case time = "Time"
    var id: String { self.rawValue }
}

enum Temperature: String, Identifiable, CaseIterable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
    var id: String { self.rawValue }
    var abbreviation: String {
        switch self {
        case .celsius:
            return "°C"
        case .fahrenheit:
            return "°F"
        case .kelvin:
            return "K"
        }
    }
}

enum Length: String, Identifiable, CaseIterable {
    case meter = "Meter"
    case kilometer = "Kilometer"
    case foot = "Foot"
    case yard = "Yard"
    case mile = "Mile"
    var id: String { self.rawValue }
    var abbreviation: String {
        switch self {
        case .meter:
            return "m"
        case .kilometer:
            return "km"
        case .foot:
            return "ft"
        case .yard:
            return "yd"
        case .mile:
            return "mi"
        }
    }
}

enum Time: String, Identifiable, CaseIterable {
    case second = "Second"
    case minute = "Minute"
    case hour = "Hour"
    case day = "Day"
    var id: String { self.rawValue }
    var abbreviation: String {
        switch self {
        case .second:
            return "sec"
        case .minute:
            return "min"
        case .hour:
            return "h"
        case .day:
            return "d"
        }
    }
}
