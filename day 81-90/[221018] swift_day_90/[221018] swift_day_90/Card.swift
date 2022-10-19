//
//  Card.swift
//  [221018] swift_day_90
//
//  Created by user on 2022/10/18.
//

import Foundation

struct Card: Codable, Hashable, Identifiable {
    let id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who plated the 13th Doctor in Doctor Who?", answer: "Jodie Whittacker")
}
