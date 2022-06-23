//
//  ContentView.swift
//  [220623] solidify_day_02
//
//  Created by user on 2022/06/23.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text("\(text)")
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}


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

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack (alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
                .background()
        }
    }
}

extension View {
    func watermarked(wite text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}


struct ContentView: View {
    var  motto1: some View {
        Text("Hello")
    }
    
    let motto2 = Text("World!")
    
    var spells: some View { // computed property
//        VStack {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    var body: some View {
//        HStack {
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundColor(.blue)
//            spells
//        }
        
        
//        VStack(spacing: 10) {
//
//            CapsuleText(text: "first")
//            CapsuleText(text: "Second")
//        }
        
//        Text("Hello world")
//            .titleStyle()
//            .modifier(Title())
        
        Color.blue
            .frame(width: 300, height: 300)
            .watermarked(wite: "Hacking with Swift")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
