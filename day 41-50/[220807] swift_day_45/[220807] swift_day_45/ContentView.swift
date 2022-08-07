//
//  ContentView.swift
//  [220807] swift_day_45
//
//  Created by user on 2022/08/07.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    
    
    var body: some View {
//        ZStack {
//            Image("Example")
//                .colorMultiply(.red)
//            Rectangle()
//                .fill(.red)
//                .blendMode(.multiply)
//        }
        
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(.red)
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(.green)
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//        Image("Example")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
//            .saturation(amount)
//            .blur(radius: (1-amount))
//
//        Slider(value: $amount)
//            .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.black)
//        .ignoresSafeArea()
        Text("Hello world")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
