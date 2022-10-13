//
//  Prospect.swift
//  [221010] swift_day_84
//
//  Created by user on 2022/10/10.
//

import Foundation

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var created = Date.now
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    let saveKey = "SavedData"
    
    init() {
        // if there is saved data
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        
        // else if there is no saved data
        self.people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func sortByName() {
        people.sort {
            $0.name < $1.name
        }
        print(self.people)
    }
    
    func sortByMostRecent() {
        people.sort {
            $0.created > $1.created
        }
        print(self.people)
    }
}
