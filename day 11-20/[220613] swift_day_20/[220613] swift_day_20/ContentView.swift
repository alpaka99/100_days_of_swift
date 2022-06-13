//
//  ContentView.swift
//  [220613] swift_day_20
//
//  Created by user on 2022/06/13.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingAlert2 = false
    
    var body: some View {
//        1. Using stacks to arrange views
//        VStack(alignment: .center, spacing: 20) {
//            HStack {
//                Text("1")
//                Text("2")
//                Text("3")
//            }
//
//            HStack {
//                Text("4")
//                Text("5")
//                Text("6")
//            }
//            HStack {
//                Text("7")
//                Text("8")
//                Text("9")
//            }
//        }
//        2. Colors and frames
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            Color(red: 1, green: 0.8, blue: 0)
//                .frame(width: 200, height: 200)
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//                .ignoresSafeArea()
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
////                .background(.blue)
//        }
//        3. Gradients
//        LinearGradient(gradient: Gradient(colors: [.white, .blue, .black]), startPoint: .top, endPoint: .bottom)
//            .frame(width: 200, height: 200)
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//        AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple, .red]), center: .center)
//        4. Buttons and images
//        Button("Delete Selection", role: .destructive, action: executeDelete)
//        VStack {
//            Button("Button 1") {}
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) {}
//                .buttonStyle(.bordered)
//            Button("Button 3") {}
//                .buttonStyle(.borderedProminent)
////                .tint(.mint)
//            Button("Button 4", role: .destructive) {}
//                .buttonStyle(.borderedProminent)
//        }
        
//        Button {
//            print("Button was tapped")
//        } label : {
//            Text("Tap me!")
//                .padding()
//                .foregroundColor(.white)
//                .background(.red)
//        }
        
//        Button {
//            print("Edit button was tapped")
//        } label: {
//            Label("Edit", systemImage: "pencil")
//        }
//        5. Showing alert messages
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]), center: .center)
            Button("Show Alert") {
                showingAlert = true
            }
            .foregroundColor(.black)
            .background(.ultraThinMaterial)
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Plz read this")
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
