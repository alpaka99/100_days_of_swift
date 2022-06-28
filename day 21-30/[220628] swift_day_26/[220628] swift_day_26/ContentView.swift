//
//  ContentView.swift
//  [220628] swift_day_26
//
//  Created by user on 2022/06/28.
//

import SwiftUI

struct ContentView: View {
//    1. Entering numbers with Stepper
    @State private var sleepAmount = 8.0
//    2. Selecting dates and times with DatePicker
    @State private var wakeUp = Date.now
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.5)
        
        DatePicker("Please Enter a date", selection: $wakeUp, in: Date.now...)
//            .labelsHidden()
        
        Text(Date.now, format:.dateTime.day().month().year().hour().minute())
        
//        3. Working with Dates
        Text(Date.now.formatted(date: .omitted, time: .shortened))
    }
        
        func trivialExample() {
            let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
            let hour = components.hour ?? 0
            let minutes = components.minute ?? 0
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
