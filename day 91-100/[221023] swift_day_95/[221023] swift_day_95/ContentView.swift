//
//  ContentView.swift
//  [221023] swift_day_95
//
//  Created by user on 2022/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var result = 0
    @State private var max = 6
    
    let maxes = [4, 6, 8, 10, 12, 20, 100]
    let initText = "Roll the dice plz"
    
    @State private var results = Array<Int>()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Pick dice type", selection: $max) {
                    ForEach(maxes, id: \.self) { number in
                        Text("\(number)-sided")
                    }
                }
                
                Button {
                    roll(max: max)
                } label: {
                    Image("dice")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 200, height: 200)
                .onChange(of: result) { _ in
                    save()
                }
                
                Text(result > 0 ? "Result is: \(String(result))" : initText)
            }
            .navigationTitle("Dice game")
            .toolbar {
                Button {
                    print("Check history")
                } label: {
                    Label("Check history", systemImage: "checkmark")
                }
            }
        }
        
    }
    
    func roll(max: Int) {
        result = Int.random(in: 1..<max+1)
        results.append(result)
    }
    
    func save() {
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
