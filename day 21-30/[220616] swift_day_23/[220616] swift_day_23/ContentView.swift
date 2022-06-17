//
//  ContentView.swift
//  [220616] swift_day_23
//
//  Created by user on 2022/06/16.
//

import SwiftUI

//struct CapsuleText: View {
//    var text: String
//
//    var body: some View {
//        Text("\(self.text)")
//            .font(.largeTitle)
//            .padding()
//            .foregroundColor(.white)
//            .background(.blue)
//            .clipShape(Capsule())
//    }
//}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
//    @State private var useRedText = false
    
//    var motto1: some View {
//        Text("Draco dormiens")
//    }
//    let motto2 = Text("nunquam titilandus")
//    var spells: some View {
//        VStack {
//            Text("Lumous")
//            Text("Obliviate")
//        }
//    }
    
    var body: some View {
//        ?. Why modifier order matters
//        Button("Hello, world") {
//            print(type(of:self.body))
//        }
//        .background(.red)
//        .frame(width: 200, height: 200)
//        Button("Hello, world") {
//            print("tapped")
//        }
//        .padding()
//        .background(.red)
//        .padding()
//        .background(.blue)
//        .padding()
//        .background(.green)
//        .padding()
//        .background(.yellow)
//        ?. Why dows SwiftUI user "some view" for it's view type?
//        VStack {
//            Text("Hello")
//            Text("World")
//        }
        
//        ?. Conditional modifier
//        Button("Hello world") {
//            useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)
        
//        ?. Environment modifier
//        VStack {
//            Text("Griffindor")
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//                .font(.largeTitle)
//        }
//        .font(.title)
        
//        ?. Views as properties
//        VStack {
//            motto1
//            motto2
//        }
        
//        ?. View Composition
//        VStack(spacing: 10) {
//            Text("First")
//                .font(.largeTitle)
//                .padding()
//                .foregroundColor(.white)
//                .background(.blue)
//                .clipShape(Capsule())
//
//            Text("Second")
//                .font(.largeTitle)
//                .padding()
//                .foregroundColor(.white)
//                .background(.blue)
//                .clipShape(Capsule())
//            CapsuleText(text: "first")
//            CapsuleText(text: "second")
//        }
        
//        ?. Custom modifier
        Text("Hello, world")
//            .modifier(Title())
            .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

