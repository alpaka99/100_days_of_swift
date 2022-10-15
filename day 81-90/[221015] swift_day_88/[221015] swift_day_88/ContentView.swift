//
//  ContentView.swift
//  [221015] swift_day_88
//
//  Created by user on 2022/10/15.
//

import SwiftUI

extension View { // making modifier
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct ContentView: View {
    @State private var cards = Array<Card>(repeating: Card.example, count: 10)
    var body: some View {
        ZStack { // holds everything and background image
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack { // holds ZStack and Timer
                ZStack { // holds stack of cards
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
