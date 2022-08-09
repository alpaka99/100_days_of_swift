//
//  CreateTodo.swift
//  [220809] swift_day_47
//
//  Created by user on 2022/08/10.
//

import SwiftUI

struct CreateTodo: View {
    let todos: Todos
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Title", text: $title)
                }
                
                Section {
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Add Todo")
            .toolbar {
                Button("add to list") {
                    var todo = Todo()
                    todo.title = title
                    todo.description = description
                    todo.updated = Date.now
                    todos.todoList.append(todo)
                    dismiss()
                }
            }
        }
    }
}

struct CreateTodo_Previews: PreviewProvider {
    static let todos = Todos()
    static var previews: some View {
        CreateTodo(todos: todos)
    }
}
