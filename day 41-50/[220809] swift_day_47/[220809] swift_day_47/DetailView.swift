//
//  DetailView.swift
//  [220809] swift_day_47
//
//  Created by user on 2022/08/10.
//

import SwiftUI

struct DetailView: View {
    let todo: Todo
    var body: some View {
        List {
            Section("What todo") {
                Text(todo.title)
            }
            
            Section("How todo") {
                Text(todo.description)
            }
            
            Section("When written") {
                Text("\(todo.updated)")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let todo = Todo()
    static var previews: some View {
        DetailView(todo: todo)
    }
}
