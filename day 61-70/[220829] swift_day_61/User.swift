//
//  User.swift
//  [220829] swift_day_61
//
//  Created by user on 2022/08/29.
//

import Foundation
import CoreImage

struct User: Codable, Hashable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    
    let friends: [Friend]
}

struct Friend: Codable, Hashable {
    let id: UUID
    let name: String
}
