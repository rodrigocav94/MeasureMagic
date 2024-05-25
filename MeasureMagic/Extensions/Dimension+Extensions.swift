//
//  Dimension+Extensions.swift
//  MeasureMagic
//
//  Created by Rodrigo Cavalcanti on 25/05/24.
//

import Foundation

extension Dimension {
    func formatted() -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter.string(from: self).capitalized
    }
}
