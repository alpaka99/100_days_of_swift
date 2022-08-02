//
//  Decode-extension.swift
//  [220802] swift_day_41
//
//  Created by user on 2022/08/02.
//

import Foundation

//extension Bundle { // 파일을 가져오는 Bundle 에 익스텐션으로 함수를 붙힘
//    func decode(_ file: String) -> [String: Astronaut] {
////        1. 우선 파일의 경로를 지정
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Cannot locate file \(file)")
//        }
//
////        2. 가져온 경로의 파일을 읽어서 Data 타입으로 저장
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Cannot read file \(file)")
//        }
//
////        3. Data 타입을 디코딩해서 원하는 타입의 반환값으로 만듬
//        guard let decoded = try? JSONDecoder().decode([String: Astronaut].self, from: data) else {
//            fatalError("Cannot decode file \(file)")
//        }
//
//        return decoded
//    }
//
//}


extension Bundle {
    func decode<T: Codable> (_ file: String) -> T {
        guard let url = try? self.url(forResource: file, withExtension: nil) else {
            fatalError("Cannot find \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Cannot load \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Cannot decode \(file)")
        }
        
        return decoded
    }
}
