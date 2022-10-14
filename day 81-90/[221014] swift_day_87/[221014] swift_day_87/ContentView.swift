//
//  ContentView.swift
//  [221014] swift_day_87
//
//  Created by user on 2022/10/14.
//

import SwiftUI
import Foundation

struct ContentView: View {
//    1. Triggering events repeatedly using a timer
//     publisher
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var count = 0
    @State private var times = [String]()
    
    @Environment(\.scenePhase) var scenePhase
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        List {
            ForEach(times, id: \.self) { time in
                Text(time)
            }
        }
            .onReceive(timer) { time in
                if count == 5 {
                    timer.upstream.connect().cancel()
                } else {
//                    print("The time is now \(time)")
                    times.append("Count: \(count+1) - The time is now \(time)")
                }

                count += 1
            }
        
//        2. How to be notified when your SwiftUI app moves to the background
//        Text("Hello world")
//            .onChange(of: scenePhase) { newPhase in
//                if newPhase == .active {
//                    print("Active")
//                } else if newPhase == .inactive {
//                    print("Inactive")
//                } else if newPhase == .background {
//                    print("Background")
//                }
//            }
        
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//
//            Text("Success")
//        }
//        .padding()
//        .background(differentiateWithoutColor ? .black : .green)
//        .foregroundColor(.white)
//        .clipShape(Capsule())
        
//        Text("Hello world")
//            .scaleEffect(scale)
//            .onTapGesture {
//                if reduceMotion {
//                    scale *= 1.5
//                } else {
//                    withAnimation {
//                        scale *= 1.5
//                    }
//                }
//            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
