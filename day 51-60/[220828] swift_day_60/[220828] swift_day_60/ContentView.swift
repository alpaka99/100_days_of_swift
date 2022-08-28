//
//  ContentView.swift
//  [220828] swift_day_60
//
//  Created by user on 2022/08/28.
//

import SwiftUI

struct Users: Codable {
    let users: [User]
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label : {
                        Text(user.name)
                    }
                }
            }
            .task{
                await getUsers()
            }
            .navigationTitle("MileStone Day")
        }
    }
    
    
    func getUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Cannot get json from the server")
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid Data")
        }
        
        
        
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
