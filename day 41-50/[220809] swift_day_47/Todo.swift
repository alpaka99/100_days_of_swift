//
//  Todo.swift
//  [220809] swift_day_47
//
//  Created by user on 2022/08/10.
//

import Foundation
import SwiftUI

class Todo: Identifiable {
    let id = UUID()
    
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var updated: Date = Date.now
}
