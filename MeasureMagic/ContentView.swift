//
//  ContentView.swift
//  MeasureMagic
//
//  Created by Rodrigo Cavalcanti on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue: Double = 0
    @FocusState private var isKeyboardFocused: Bool
    @State private var selectedType: AvailableMeasure = .temperature
    @State private var inputIndex = 0
    @State private var outputIndex = 0
    
    var result: String {
        let inputUnit = selectedType.cases[safe: inputIndex] ?? selectedType.cases.first!
        let outputUnit = selectedType.cases[safe: outputIndex] ?? selectedType.cases.first!
        
        let measurement = Measurement(value: initialValue, unit: inputUnit)
        let result = measurement.converted(to: outputUnit)
        
        return result.description
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ZStack {
                        Color(UIColor.systemGroupedBackground)
                        Picker("Conversion selected", selection: $selectedType) {
                            ForEach(AvailableMeasure.allCases, id: \.self) {
                                Text($0.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .listRowInsets(EdgeInsets())
                }
                
                Section("Convert from") {
                    Picker("Input scale", selection: $inputIndex) {
                        ForEach(selectedType.cases.indices, id: \.self) {
                            Text(selectedType.cases[$0].formatted())
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    HStack {
                        Text("Value")
                        TextField("Input value", value: $initialValue, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($isKeyboardFocused)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Section("Convert to") {
                    Picker("Output scale", selection: $outputIndex) {
                        ForEach(selectedType.cases.indices, id: \.self) {
                            Text(selectedType.cases[$0].formatted())
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    HStack {
                        Text("Result")
                        Text(result)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .multilineTextAlignment(.trailing)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("MeasureMagic")
            .toolbar {
                if isKeyboardFocused {
                    Button("Done") {
                        isKeyboardFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
