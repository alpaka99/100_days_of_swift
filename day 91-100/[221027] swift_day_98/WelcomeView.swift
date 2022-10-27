//
//  WelcomeView.swift
//  [221027] swift_day_98
//
//  Created by user on 2022/10/27.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; swipe from the left edge to show it")
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
