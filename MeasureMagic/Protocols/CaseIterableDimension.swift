//
//  CaseIterableDimension.swift
//  MeasureMagic
//
//  Created by Rodrigo Cavalcanti on 25/05/24.
//

import Foundation

protocol CaseIterableDimension  {
    associatedtype T: Dimension = Self.Type
    static var allCases: [T] { get }
}


extension UnitTemperature: CaseIterableDimension {
    public static let allCases: [UnitTemperature] = [.fahrenheit, .celsius, .kelvin]
}

extension UnitEnergy: CaseIterableDimension {
    public static let allCases: [UnitEnergy] = [.calories, .joules, .kilocalories, .kilojoules, .kilowattHours]
}

extension UnitLength: CaseIterableDimension {
    public static let allCases: [UnitLength] = [.astronomicalUnits, .centimeters, .decameters, .decimeters, .fathoms, .feet, .furlongs, .hectometers, .inches, .kilometers, .lightyears, .megameters, .meters, .micrometers, .miles, .millimeters, .nanometers, .nauticalMiles, .parsecs, .picometers, .scandinavianMiles, .yards]
}


extension UnitVolume: CaseIterableDimension {
    static let allCases: [UnitVolume] = [.acreFeet, .bushels, .centiliters, .cubicCentimeters, .cubicDecimeters, .cubicFeet, .cubicInches, .cubicKilometers, .cubicMeters, .cubicMiles, .cubicMillimeters, .cubicYards, .cups, .deciliters, .deciliters, .fluidOunces, .gallons, .imperialFluidOunces, .imperialGallons, .imperialPints, .imperialQuarts, .imperialTablespoons, .kiloliters, .liters, .megaliters, .metricCups, .milliliters, .pints, .quarts, .tablespoons, .teaspoons]
}
