//
//  ContentView.swift
//  [220729] swift_day_39
//
//  Created by user on 2022/07/29.
//

import SwiftUI

//struct CustomText: View {
//    let text: String
//
//    var body: some View {
//        Text(text)
//    }
//
//    init(_ text: String) {
//        print("Creating a new CustomText")
//        self.text = text
//    }
//}

//struct User: Codable {
//    let name: String
//    let address: Address
//}
//
//struct Address: Codable {
//    let street: String
//    let city: String
//}

let layout = [
    GridItem(.adaptive(minimum: 80, maximum: 120))
]
struct ContentView: View {
    var body: some View {
//        1. Resizing images to fit the screen using GeometryReader
//        GeometryReader { geo in
//            Image("example")
//                .resizable()
//                .scaledToFit()
////                .frame(width: 300, height: 300)
//                .frame(width: geo.size.width * 0.8, height: 300)
//                .frame(width: geo.size.width, height: geo.size.height)
//    //            .clipped()
//        }
        
//        3. How ScrollView lets us work with scrolling data
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                }
//                Text("The End!")
//            }
//            .frame(maxWidth: .infinity)
//        }
        
//        4. Pushing new views onto the stack using NavigationLink
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                Text("Row, \(row)!")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
        
//        5. Working with hierarchical Codable data
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//
//            let data = Data(input.utf8)
//
//            if let user = try? JSONDecoder().decode(User.self, from: data) {
//                print(user.address.street)
//            } else {
//                print(type(of: input))
//            }
//        }
        
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
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
