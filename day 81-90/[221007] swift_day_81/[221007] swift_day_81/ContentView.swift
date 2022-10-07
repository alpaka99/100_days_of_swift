//
//  ContentView.swift
//  [221007] swift_day_81
//
//  Created by user on 2022/10/07.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var backgroundColor = Color.red
    var body: some View {
//        1. Creating context menus
//        Text("Change Color")
//            .padding()
//            .background(backgroundColor)
//            .contextMenu {
//                Button(role: .destructive) {
//                    backgroundColor = Color.red
//                } label: {
//                    Label("Red", systemImage: "checkmark.circle")
//                        .foregroundColor(.red)
//                }
//                Button(role: .cancel) {
//                    backgroundColor = Color.blue
//                } label: {
//                    Label("Blue", systemImage: "checkmark.rectangle")
//                }
//                Button("Green") {
//                    backgroundColor = Color.green
//                }
//            }
        
        
//        2. Adding custom swipe actions to a List
//        List {
//            Text("Taylor Swift")
//                .swipeActions {
//                    Button(role: .destructive) {
//                        print("Deleting")
//                    } label: {
//                        Label("Delete", systemImage: "minus.circle")
//                    }
//                }
//                .swipeActions(edge: .leading) {
//                    Button {
//                        print("Pinning")
//                    } label: {
//                        Label("Pin", systemImage: "pin")
//                    }
//                    .tint(.orange)
//                }
//        }
        
//        3. Scheduling local notifications
        VStack {
            Button("Request Permission") {
                // first
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                // second
                let content = UNMutableNotificationContent()
                content.title = "Notification from @dev.tenev"
                content.subtitle = "Hello there 🙂"
                content.sound = UNNotificationSound.default
                
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
