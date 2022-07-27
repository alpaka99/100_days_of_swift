//
//  ExpenseItem.swift
//  [220727] swift_day_37
//
//  Created by user on 2022/07/27.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
