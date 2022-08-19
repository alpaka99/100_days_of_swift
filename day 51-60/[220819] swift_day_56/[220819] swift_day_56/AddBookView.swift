//
//  AddBookView.swift
//  [220819] swift_day_56
//
//  Created by user on 2022/08/19.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 3.0
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Book title", text: $title)
                    TextField("Name of Author", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text("\(Int(rating))")
                    Slider(value: $rating, in: 1...5, step: 1)
                    TextEditor(text: $review)
                }
                
                Button("Add Book") {
                    let book = Book(context: moc)
                    book.id = UUID()
                    book.title = title
                    book.author = author
                    book.rating = Int16(rating)
                    book.genre = genre
                    book.review = review
                    book.date = Date.now
                    
                    try? moc.save()
                    dismiss()
                }
                .disabled(checkBookDetail() == false)
            }
            .navigationTitle("Add Book")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func checkBookDetail() -> Bool {
        if title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty {
            return false
        }
        return true
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
