//
//  ContentView.swift
//  [220815] swift_day_52
//
//  Created by user on 2022/08/15.
//

import SwiftUI

struct ContentView: View {
    @State var order = Order()
    @State var selectedType = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select flavour", selection: $selectedType) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("How many IceCreams? \(order.quantity)", value: $order.quantity, in: 0...20)
                    
                    Toggle("Special Options", isOn: $order.specialOptions.animation())
                    
                    if order.specialOptions {
                        Toggle("Extra frostings", isOn: $order.extraFrostings)
                        Toggle("Add sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("Delivery details")
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
