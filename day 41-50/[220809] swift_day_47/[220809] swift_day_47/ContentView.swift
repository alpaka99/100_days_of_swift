//
//  ContentView.swift
//  [220809] swift_day_47
//
//  Created by user on 2022/08/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var todos = Todos()
    
    
    @State private var showCreateView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos.todoList) { todo in
                    NavigationLink {
                        DetailView(todo: todo)
                    } label: {
                        Text("\(todo.title)")
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("iTodo")
            .toolbar {
                Button() {
//                    TodoList.append(Todo(title:"test\(TodoList.count)", description: "description\(TodoList.count)"))
                    showCreateView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showCreateView) {
                    CreateTodo(todos: todos)
                }
            }
        }
    }
    
    func deleteItem(_ offset: IndexSet) {
        todos.todoList.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
