//
//  ContentView.swift
//  [220617] swift_day_24
//
//  Created by user on 2022/06/17.
//

import SwiftUI

struct ContentView: View {
    let hogwarts = ["Griffindor", "Slytherin", "Hufflepuff", "Ravenclaw"]
    
    @State private var dormitory = Int.random(in: 0...3)
    
    var body: some View {
        VStack {
            Text("You have recevied invitation from hogwarts")
            Text("Your dormitory is...")
            Text("\(hogwarts[dormitory])!")
            
            Button {
                
            } label: {
                Image(hogwarts[dormitory])
                    .frame(width:10, height:10)
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
