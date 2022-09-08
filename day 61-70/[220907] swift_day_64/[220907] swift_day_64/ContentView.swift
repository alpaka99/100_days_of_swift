//
//  ContentView.swift
//  [220907] swift_day_64
//
//  Created by user on 2022/09/07.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showImagePicker = true
            }
            
            Button("Save Image") {
                guard let inputImage = inputImage else { return }
                
                let imageServer = ImageServer()
                imageServer.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in
            loadImage()
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
