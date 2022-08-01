//
//  Mission.swift
//  [220801] swift_day_40
//
//  Created by user on 2022/08/01.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable { // nested struct
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
