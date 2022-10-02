//
//  ContentView.swift
//  [221002] swift_day_77
//
//  Created by user on 2022/10/02.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var showNameAlert = false
    @State private var showAddName = false
    
    @State private var names = [String]()
    @State private var pictureName = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            
            Button("Select Image") {
                showImagePicker = true
            }
            
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .alert("Add name to this picture?", isPresented: $showNameAlert){
            Button("Add name") {
                showAddName = true
            }
            
            Button("No") {
                
            }
        } message: {
            TextEditor(text: $pictureName)
        }
        
        .sheet(isPresented: $showAddName) {
            Form {
                Section {
                    VStack {
                        image?
                            .resizable()
                            .scaledToFit()
                        
                        TextField("Name of Picture", text: $pictureName)
                    }
                }
                
                Section {
                    Button("Save") {
                        names.append(pictureName)
                        dismiss()
                    }
                }
            }
        }
        .onChange(of: inputImage) { _ in
            loadImage()
            showNameAlert = true
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
