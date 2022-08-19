//
//  DetailBookView.swift
//  [220819] swift_day_56
//
//  Created by user on 2022/08/19.
//

import SwiftUI

struct DetailBookView: View {
    let book: Book
    
    var body: some View {
        List {
            ZStack(alignment: .topLeading) {
                Image(book.genre ?? "Unknown Genre")
                    .resizable()
                    .scaledToFit()
                Text(book.genre ?? "Unknwon genre")
                    .font(.headline)
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            Section {
                Text("Title: \(book.title ?? "Unknown Title")")
                Text("Author: \(book.author ?? "Unknown Author")")
                Text("Genre: \(book.genre ?? "Unknown Genre")")
                
            }
            
            Section {
                Text("Rating: \(book.rating ?? 0)")
                Text("Review: \(book.review ?? "Unknown Review")")
            }
            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                
            } label: {
                Label("delete book", systemImage: "trash")
            }
        }
    }
}

//struct DetailBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailBookView()
//    }
//}
