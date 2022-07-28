//
//  ItemInfo.swift
//  [220728] swift_day_38
//
//  Created by user on 2022/07/28.
//

import SwiftUI

struct ItemInfo: View {
    @StateObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var purpose = "Personal"
    let purposes = ["Business", "Personal"]
    @State private var price = 0.0
    
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("Name: ", text: $name)
                    
                    Picker("Purpose:", selection: $purpose) {
                        ForEach(purposes, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Price", value: $price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                     
                }
            }
            .toolbar {
                Button("Add to expense") {
                    let newItem = ExpenseItem(name: name, purpose: purpose, price: price)
                    
                    expenses.items.append(newItem)
                    print(expenses.items)
                    dismiss()
                }
            }
        }
    }
}

struct ItemInfo_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
//        ItemInfo(expenses: )
    }
}
