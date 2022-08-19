//
//  ContentView.swift
//  [220819] swift_day_56
//
//  Created by user on 2022/08/19.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var books: FetchedResults<Book>
    
    
    @State private var showingAddBook = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailBookView(book: book)
                    } label: {
                        Text(book.title ?? "Unknown Book")
                    }
                    .foregroundColor(book.rating <= 2 ? .red : .primary)
                }
                .onDelete(perform: deleteBook)
            }
                .navigationTitle("Bookworm wrap-up")
                .toolbar {
                    Button {
                        showingAddBook.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                .sheet(isPresented: $showingAddBook) {
                    AddBookView()
                }
        }
    }
    
    func deleteBook(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
