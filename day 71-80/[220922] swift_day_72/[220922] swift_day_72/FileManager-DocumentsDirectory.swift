//
//  FileManager-DocumentsDirectory.swift
//  [220922] swift_day_72
//
//  Created by user on 2022/09/25.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
