//
//  ContentView.swift
//  unitConversions
//
//  Created by Alessandre Livramento on 24/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var unitInput = 0.0
    @State private var selectUnitsI = "Celsius"
    @State private var selectUnitsO = "Celsius"
    
    let units = ["Celsius", "Fahrenheit" ,"Kelvin"]
    
    var unitCalc: Double {
        var temp = 0.0
        
        if selectUnitsI == selectUnitsO {
            temp = unitInput
        }
       
        //-- Celsius
        if selectUnitsI == "Celsius" && selectUnitsO == "Fahrenheit" && unitInput != 0.0{
            temp = (unitInput * 1.8) + 32.0
        }
        
        if selectUnitsI == "Celsius" && selectUnitsO == "Kelvin" && unitInput != 0.0 {
            temp = unitInput + 273.15
        }
        
        
        //-- Fahrenheit
        if selectUnitsI == "Fahrenheit" && selectUnitsO == "Celsius" && unitInput != 0.0 {
            temp = (unitInput - 32.0) * 5/9
        }
        
        if selectUnitsI == "Fahrenheit" && selectUnitsO == "Kelvin" && unitInput != 0.0 {
            temp = (unitInput - 32.0) * 5/9 + 273.15
        }
        
        
        //-- Kevin
        if selectUnitsI == "Kelvin" && selectUnitsO == "Celsius" && unitInput != 0.0 {
            temp = unitInput - 273.15
        }
        
        if selectUnitsI == "Kelvin" && selectUnitsO == "Fahrenheit" && unitInput != 0.0{
            temp = (unitInput - 273.15) * 9/5 + 32
        }
        
        return temp
    }
    
    var unit: String {
        return  "\(Int(unitCalc))°\(selectUnitsO.first!)"
    }

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input unit", selection: $selectUnitsI) {
                        ForEach(units, id: \.self ){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input unit")
                }
                
                Section {
                    Picker("Input unit", selection: $selectUnitsO) {
                        ForEach(units, id: \.self ){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output unit")
                }
                
                Section {
                    TextField("Value to be converted", value: $unitInput, format: .number)
                        .keyboardType(.numberPad)
                } header: {
                    Text("Enter the amount to be converted here")
                }
                
                Section {
                    Text(unit)
                } header: {
                    Text("Conversion")
                }
            }
            .navigationTitle("Unit Converts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
