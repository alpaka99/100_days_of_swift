//
//  ContentView.swift
//  [221022] swift_day_94
//
//  Created by user on 2022/10/22.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .scaleEffect(x: geo.frame(in: .global).minY / 500)
//                            .background(colors[index % 7].opacity(geo.frame(in: .global).minY * 0.01))
                            .background(Color(hue: min(1, geo.frame(in: .global).minY / 600), saturation: geo.frame(in: .global).minY / 500, brightness: geo.frame(in: .global).minY / 500).opacity(geo.frame(in: .global).minY / 200))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
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
