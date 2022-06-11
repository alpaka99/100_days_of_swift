//
//  ContentView.swift
//  [220611] swift_day_18
//
//  Created by user on 2022/06/11.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    
    var grandTotal: Double {
        let tipValue = checkAmount * Double(tipPercentage / 100)
        
        return tipValue + Double(checkAmount)
    }
    
    var perPerson: Double {
        return grandTotal / Double(numberOfPeople + 2)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("How much", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<101) { i in
                            Text("\(i) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0) %")
                        }
                    }
                } header: {
                    Text("Tip Percentage")
                }
                
                Section {
                    Text("Grand Total: \(grandTotal)")
                    
                } header: {
                    Text("Grand Total")
                }
                
                Section {
                    Text("$/per: \(perPerson)")
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("My check split app")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
