//
//  Mission.swift
//  [220803] swift_day_42
//
//  Created by user on 2022/08/04.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct Crew: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [Crew]
    let description: String
    
    var missionName: String {
        "apollo\(id)"
    }
}
