//
//  AvailableMeasure.swift
//  MeasureMagic
//
//  Created by Rodrigo Cavalcanti on 25/05/24.
//

import Foundation

enum AvailableMeasure: String, CaseIterable {
    case temperature, energy, length, volume
    
    var cases: [Dimension] {
        switch self {
        case .temperature:
            return UnitTemperature.allCases
        case .energy:
            return UnitEnergy.allCases
        case .length:
            return UnitLength.allCases
        case .volume:
            return UnitVolume.allCases
        }
    }
}
