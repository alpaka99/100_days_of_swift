//
//  Decode-Extension.swift
//  [220803] swift_day_42
//
//  Created by user on 2022/08/04.
//

import Foundation

extension Bundle {
    func decode<T: Codable> (_ file: String) -> T {
        guard let url = try? self.url(forResource: file, withExtension: nil) else {
            fatalError("Cannot find \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Cannot load \(file)")
        }
        
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Cannot decode \(file)")
        }
        
        return decoded
    }
}
