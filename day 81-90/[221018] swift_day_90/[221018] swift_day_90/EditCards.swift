//
//  EditCards.swift
//  [221018] swift_day_90
//
//  Created by user on 2022/10/18.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = [Card]()
    
    @State private var newPrompt = ""
    @State private var newAnswer = "New TextEditor: "
    var body: some View {
        NavigationView {
            
            List {
                Section("Add new card") {
                    TextField("New prompt: ", text: $newPrompt)
                        .padding()
                    
                    TextEditor(text: $newAnswer)
                        .frame(height: 200)
                        .padding()
                        .onTapGesture {
                            newAnswer = ""
                        }
                    
                    Button("Add card", action: addCard)
                }
                
                ForEach(0..<cards.count, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(cards[index].prompt)
                            .font(.headline)
                        
                        Text(cards[index].answer)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete(perform: removeCards)
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }
    
    func done() {
        dismiss()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    
    func addCard() {
        
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        print(card)
        cards.insert(card, at: 0)
        saveData()
    }
    
    func removeCards(_ offset: IndexSet) {
        cards.remove(atOffsets: offset)
        saveData()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
