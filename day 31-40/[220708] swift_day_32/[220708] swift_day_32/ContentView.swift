//
//  ContentView.swift
//  [220708] swift_day_32
//
//  Created by user on 2022/07/08.
//

import SwiftUI

struct ContentView: View {
//    @State private var animationAmount = 1.0
//    @State private var animationAmount = 1.0
    @State private var animationAmount = 0.0
    
    var body: some View {
//        1. Creating implicit animations && 2. Customizing animations in SwiftUI
//        Button("Tap Me") {
////            animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(
//                    .easeInOut(duration: 2)
//                    .repeatForever(autoreverses: false),
//                           value: animationAmount)
//        )
//        .onAppear{
//            animationAmount = 2
//        }
////        .scaleEffect(animationAmount)
////        .blur(radius: (animationAmount-1) * 3)
//
//        3. Animating bindings
//        print(animationAmount)
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
        
        Button("Tap Me") {
            withAnimation {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
