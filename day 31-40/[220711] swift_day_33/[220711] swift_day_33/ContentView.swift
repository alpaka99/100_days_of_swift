//
//  ContentView.swift
//  [220711] swift_day_33
//
//  Created by user on 2022/07/11.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//    let letters = Array("Hello, SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//    @State private var isShowingRed = false
    @State private var isShowingRed = false
    
    var body: some View {
//        1. Controlling the animation stack
//        Button("Tap Me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .animation(.default, value: enabled)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//            DragGesture()
//                .onChanged{ dragAmount = $0.translation }
//                .onEnded{ _ in
//                    withAnimation{
//                        dragAmount = .zero
//                    }
//                }
//            )
//        2. Animating gestures
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) {num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .foregroundColor(.white)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(num)/20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged {
//                    dragAmount = $0.translation
//                }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                })
//        3. Showing and hiding views with transitions
//        VStack {
//            Button("Tap me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
        
//        }
        
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
            .onTapGesture {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
