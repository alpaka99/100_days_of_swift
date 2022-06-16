//
//  ContentView.swift
//  [220616] swift_day_23
//
//  Created by user on 2022/06/16.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    var body: some View {
//        ?. Why modifier order matters
//        Button("Hello, world") {
//            print(type(of:self.body))
//        }
//        .background(.red)
//        .frame(width: 200, height: 200)
        Button("Hello, world") {
            print("tapped")
        }
        .padding()
        .background(.red)
        .padding()
        .background(.blue)
        .padding()
        .background(.green)
        .padding()
        .background(.yellow)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
