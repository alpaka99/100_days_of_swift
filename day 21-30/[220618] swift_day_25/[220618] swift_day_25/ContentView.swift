//
//  ContentView.swift
//  [220618] swift_day_25
//
//  Created by user on 2022/06/18.
//

import SwiftUI

struct ContentView: View {
    let rockscissorspaper = ["rock", "scissors", "paper"]
    
    @State private var chosen = Int.random(in: 0...2)
    
    @State private var message = ""
    
    @State private var isShown = false
    
    var body: some View {
        ZStack {
            Image("rsp")
                .frame(width: 400, height: 800)
            
            VStack {
                VStack {
                    Text("Choose from Rock Scissors and Paper!")
                    Text("To win the game!")
                }
                .font(.largeTitle.weight(.bold))
                
                HStack {
                    ForEach(0..<3) { idx in
                        Button {
                            message = rockscissorspaper[idx]
                            isShown = true
                        } label: {
                            Text("\(rockscissorspaper[idx])")
                            Image("\(rockscissorspaper[idx])")
                                .frame(width: 10, height: 10)
                        }
                        .alert("\(rockscissorspaper[idx])", isPresented: $isShown) {
                            
                        }
                    }
                }
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
