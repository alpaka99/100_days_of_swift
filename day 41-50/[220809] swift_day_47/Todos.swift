//
//  Todos.swift
//  [220809] swift_day_47
//
//  Created by user on 2022/08/10.
//

import Foundation

class Todos: ObservableObject {
    let id = UUID()
    
    @Published var todoList = [Todo]()
}
