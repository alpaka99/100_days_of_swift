//
//  Expenses.swift
//  [220728] swift_day_38
//
//  Created by user on 2022/07/28.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
