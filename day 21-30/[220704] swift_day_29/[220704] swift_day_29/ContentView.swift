//
//  ContentView.swift
//  [220704] swift_day_29
//
//  Created by user on 2022/07/04.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
//    1. introducing List, your best friend
        List(people, id: \.self) {
            Text("\($0)")
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        .listStyle(.grouped)
        
    }
    
//    2. Loading resoureces from your app bundle
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // in this case fileContents is a String!
            }
        }
    }
    
    
    func test() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")

        let input2 = """
a
b
c
"""
        let letters2 = input2.components(separatedBy: "\n")

        let letter = letters.randomElement() ?? ""

        let trimmed = letter.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "Swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
