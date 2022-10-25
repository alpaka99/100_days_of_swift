//
//  ContentView.swift
//  [221024] swift_day_96
//
//  Created by user on 2022/10/24.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}
 
struct ContentView: View {
    @State private var selectedUser: User? = nil
    
    @State private var layoutVertically = false
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    @State private var searchText = ""
    
    var body: some View {
//        1. Working with two side by side views in SwiftUI
//        NavigationView {
//            NavigationLink {
//                Text("New Secondary")
//            } label: {
//                Text("Hello, world")
//            }
//                .navigationTitle("Primary")
//
//            Text("Secondary")
//
//            Text("Tertiary")
//        }
        
//        Text("Hello, world")
//            .onTapGesture {
//                selectedUser = User()
//            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
        
//        3. Using groups as transparent layout containers
//        if sizeClass == .compact {
//            VStack {
//                UserView()
//            }
//        }else {
//                HStack {
//                    UserView()
//                }
//            }
        
        NavigationView {
                    List(filteredNames, id: \.self) { name in
                        Text(name)
                    }
                    .searchable(text: $searchText, prompt: "Look for something")
                    .navigationTitle("Searching")
                }
    }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter{ $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
