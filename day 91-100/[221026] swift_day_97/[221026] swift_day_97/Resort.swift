//
//  Resort.swift
//  [221026] swift_day_97
//
//  Created by user on 2022/10/26.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
//    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
//    static let example = allResorts[0]
    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
}
