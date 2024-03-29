//
//  ContentView.swift
//  [221005] swift_day_80
//
//  Created by user on 2022/10/05.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            print(self.value)
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ContentView: View {
//    @StateObject private var updater = DelayedUpdater()
    
    @State private var output = ""
    
    var body: some View {
//        1. Manually publishing ObservableObject changes
//        Text("Value is \(updater.value)")
        
//        2. Understanding Swift's Result type
//        Text(output)
//            .task {
//                await fetchReadings()
//            }
        
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
//        do {
//            output = try result.get()
//        } catch {
//            print("Download error")
//        }
        
        switch result {
            case .success(let str):
            output = str
            case .failure(let error):
            output = "Download error: \(error.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
