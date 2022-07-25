//
//  ContentView.swift
//  [220725] swift_day_34
//
//  Created by user on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
//    variables about initial settings
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var answerNum = Int.random(in: 0...3)
    
//    variables about game playing
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var rotationValues = [0.0, 0.0, 0.0, 0.0]
    @State private var opacityValues = [1.0, 1.0, 1.0, 1.0]
    
    
    var body: some View {
        NavigationView {
            Section{
                ZStack {
                    LinearGradient(colors: [.white, .blue, .black], startPoint: .topTrailing, endPoint: .bottomTrailing)
                    VStack {
                        Text("Choose \(countries[answerNum])")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        ForEach(0..<4, id: \.self) { num in
                            Button() {
                                onClicked(answer: answerNum, currentNum: num)
                            } label: {
                                Image(countries[num])
                            }
                            .rotation3DEffect(.degrees(rotationValues[num]), axis: (x: 0, y: 1, z: 0))
                            .opacity(opacityValues[num]
                            )
                            .clipShape(Capsule())
                            
                            }
                        
                        .alert("Your answer is...", isPresented: $showAlert) {
                            Button("OK") { reset() }
                        } message: {
                            Text("\(alertMessage)")
                        }
                    }
                }
            }
            .navigationTitle("Guess the Flag")
        }
    }
    
    func onClicked(answer answer: Int, currentNum currentNum: Int) {
        if answer == currentNum {
            alertMessage = "Correct!"
        }
        else {
            alertMessage = "Wrong :("
        }
        
        showAlert.toggle()
        
        withAnimation{
            rotationValues[currentNum] += 360
        }
        
        for i in (0..<4) {
            if i != currentNum {
                opacityValues[i] = 0.75
            }
        }
    }
    
    func reset() {
        for i in (0..<opacityValues.count) {
            opacityValues[i] = 1.0
        }
        
        countries.shuffle()
        answerNum = Int.random(in: 0...3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
