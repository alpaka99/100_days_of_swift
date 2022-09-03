//
//  ContentView.swift
//  [220903] swift_day_62
//
//  Created by user on 2022/09/03.
//

import SwiftUI

struct ContentView: View {
//    1. How property wrappers become structs
//    @State private var blurAmount = 0.0 {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
    
//    @State private var blurAmount = 0.0
    
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
//        2. Responding to state changes using onChange()
//        VStack {
//            Text("Hello, world")
//                .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) { newValue in
//                    print("onChange: New value is \(newValue)")
//                }
//
//            Button("Random blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//        }
        Text("Hello, world")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Purple") { backgroundColor = .purple }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
