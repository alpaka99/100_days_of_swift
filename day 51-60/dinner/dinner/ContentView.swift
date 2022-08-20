//
//  ContentView.swift
//  dinner
//
//  Created by user on 2022/08/19.
//

import SwiftUI

struct ContentView: View {
    @State private var dinner = "아직 모른"
    
    var menus = ["최고집", "위너스", "해장국", "고기", "양꼬치"]
    
    var body: some View {
        VStack {
            Text("오늘 저녁은 \(dinner)다!")
        }
    
        Button {
            dinner = menus[Int.random(in: 0..<menus.count)]
        } label : {
            Text("저녁 고르기!")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
