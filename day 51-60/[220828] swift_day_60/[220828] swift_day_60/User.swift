//
//  User.swift
//  [220828] swift_day_60
//
//  Created by user on 2022/08/28.
//

import Foundation

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
    let id: String
    let name: String
}

