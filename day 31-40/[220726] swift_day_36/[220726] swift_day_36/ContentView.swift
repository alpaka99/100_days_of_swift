//
//  ContentView.swift
//  [220726] swift_day_36
//
//  Created by user on 2022/07/26.
//

import SwiftUI



//1. Why @State only works with structs && 2. Sharing SwiftUI state with @StateObjects
//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

//3. Showing and hiding views
//struct SecondView: View {
//    @Environment(\.dismiss) var dismiss
//    var name: String
//
//    var body: some View {
//        Button("Dissmiss") {
//            dismiss()
//        }
//    }
//}

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
//    @StateObject var user = User()
//    @State private var showingSheet = false
//    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    @AppStorage("Tap") private var tapCount = 0
//    @State private var user = User(firstName: "taylor", lastName: "Swift")
    
    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//
//            TextField("FirstName: ", text: $user.firstName)
//            TextField("LastName: ", text: $user.lastName)
//        }
//        Button("Show Sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "De jong")
//        }
        
//        4. Deleting items using onDelete()
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(0..<numbers.count, id: \.self) {
//                        Text("Row \(numbers[$0])")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .navigationTitle("onDelete")
//            .toolbar {
//                EditButton()
//            }
//        }
//        5. storing user settings with UserDefaults and @AppStorage
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
        
//        Button("Save User") {
//            let encoder = JSONEncoder()
//            if let data = try? encoder.encode(user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
    }
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
