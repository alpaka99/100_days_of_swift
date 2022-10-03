//
//  ContentView.swift
//  [221003] swift_day_78
//
//  Created by user on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
    let locationFetcher = LocationFetcher()

    var body: some View {
        VStack {
            Button("Start Tracking Location") {
                self.locationFetcher.start()
            }

            Button("Read Location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    print("Your location is \(location)")
                } else {
                    print("Your location is unknown")
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
