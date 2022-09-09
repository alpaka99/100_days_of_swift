//
//  ImageServer.swift
//  [220909] swift_day_65
//
//  Created by user on 2022/09/09.
//

import Foundation
import UIKit

class ImageServer: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Error ocuured while saving image \(error)")
        } else {
            print("Save finished!")
        }
    }
}
