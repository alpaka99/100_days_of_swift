//
//  ContentView.swift
//  [220615] swift_day_22
//
//  Created by user on 2022/06/15.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    
    @State private var correctAnswer = Int.random(in: 0...3)
    
    @State var message: String = ""
    @State var showAlert: Bool = false
    @State var alertButton: String = ""
    
    @State private var currentScore: Int = 0
    @State private var stage = 0
    let limitStage = 4
    
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Guess the Flag")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                }
                
                VStack {
                    ForEach(0..<4, id: \.self) { number in
                        Button {
                            stage += 1
                            if number == correctAnswer {
                                currentScore += 1
                                if stage == limitStage {
                                 message = "Correct ! \n You've got \(currentScore) out of \(stage) questions"
                                    alertButton = "Restart"
                                } else {
                                    message = "Correct!"
                                    alertButton = "OK"
                                }
                            } else {
                                if stage == limitStage {
                                    message = "Wrong :( \n You've got \(currentScore) ouf of \(stage) questions"
                                    alertButton = "Restart"
                                    
                                } else {
                                    message = "Wrong :("
                                    alertButton = "OK"
                                }
                            }
                            
                            countries.shuffle()
                            correctAnswer = Int.random(in: 0...3)
                            showAlert = true
                        } label: {
                            Image(countries[number])
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .alert("Answer is...", isPresented: $showAlert){
                            Button("\(alertButton)") {
                                if stage == limitStage {
                                    currentScore = 0
                                    stage = 0
                                }
                            }
                        } message: {
                            Text("\(message)")
                        }
                        .clipShape(Circle())
                        
                    }
                }
                
                Text("Score: \(currentScore)")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
