//
//  ContentView.swift
//  [220829] swift_day_61
//
//  Created by user on 2022/08/29.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        Text(user.name)
                    }
                    .padding()
                }
            }
            .navigationTitle("Time for Core Data")
            .task {
                await loadData()
            }
        }
    }
    
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Cannot loadData from web")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
