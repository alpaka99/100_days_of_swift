//
//  ExpenseItem.swift
//  [220728] swift_day_38
//
//  Created by user on 2022/07/28.
//

import Foundation

struct ExpenseItem: Identifiable {
    var id = UUID()
    let name: String
    let purpose: String
    let price: Double
}
