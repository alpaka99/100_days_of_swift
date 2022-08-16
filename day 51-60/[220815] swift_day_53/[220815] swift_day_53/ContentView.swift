//
//  ContentView.swift
//  [220815] swift_day_53
//
//  Created by user on 2022/08/16.
//

import SwiftUI

//1. Creating a custom component with @Binding
//struct PushButton: View {
//    let title: String
//    @Binding var isOn: Bool
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white:0.6), Color(white: 0.4)]
//
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background {
//            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
//        }
//        .foregroundColor(.white)
//        .clipShape(Capsule())
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}



struct ContentView: View {
//    @State private var rememberMe = false
//    @AppStorage("notes") private var notes = ""
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
//        VStack {
//            PushButton(title: "Remember Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
//        NavigationView {
//            TextEditor(text: $notes)
//                .navigationTitle("Notes")
//                .padding()
//        }
        VStack {
            List(students) { student in
                Text(student.name ?? "unknown")
            }
        }
        
        Button("Add") {
            let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
            let lastNames = ["Granger", "Lovegood", "Potter", "Wesley"]
            
            let chosenFirstName = firstNames.randomElement()!
            let chosenLastName = lastNames.randomElement()!
            
            let student = Student(context: moc)
            student.id = UUID()
            student.name = "\(chosenFirstName) \(chosenLastName)"
            
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
