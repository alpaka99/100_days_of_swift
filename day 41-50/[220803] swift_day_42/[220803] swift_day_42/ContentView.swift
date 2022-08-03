//
//  ContentView.swift
//  [220803] swift_day_42
//
//  Created by user on 2022/08/04.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let column = [
        GridItem(.adaptive(minimum: 150, maximum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(missions) { mission in
                    NavigationLink() {
                        Text("Detail View")
                    } label: {
                        Image(mission.missionName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                }
                .padding(.horizontal)
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
