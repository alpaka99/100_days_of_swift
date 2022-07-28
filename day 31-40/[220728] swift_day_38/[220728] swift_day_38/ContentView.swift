//
//  ContentView.swift
//  [220728] swift_day_38
//
//  Created by user on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingItemInfo = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.self.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("iExpense - Wrap Up")
            .toolbar {
                Button("Add item") {
//                    let newItem = ExpenseItem(name: "test", purpose: "test", price: 1.0)
//                    expenses.items.append(newItem)
                    showingItemInfo.toggle()
                }
                .sheet(isPresented: $showingItemInfo) {
                    
                    ItemInfo(expenses: expenses)
                }
            }
        }
    }
    
    func deleteItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
