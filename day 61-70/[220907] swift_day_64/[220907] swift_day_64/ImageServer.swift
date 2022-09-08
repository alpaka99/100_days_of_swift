//
//  ImageServer.swift
//  [220907] swift_day_64
//
//  Created by user on 2022/09/08.
//

import Foundation
import UIKit

class ImageServer: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
