//
//  ContentView.swift
//  Shared
//
//  Created by user on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
//    @State private var tapCount = 0
//    @State private var name = "Anonymous"
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
// 1. understanding the basic structure of a swift
//        2. creating a Form
//        3. adding a navigationBar
//        NavigationView{
//            Form {
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//
//                Group {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//
//        4. modifying program state
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
//        5. binding state to user interface control
//        Form {
//            TextField("Enter your name", text: $name)
//            Text("Hello, \(name)")
//        }
        
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id:\.self) { student in
                        Text(student)
                    }
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
