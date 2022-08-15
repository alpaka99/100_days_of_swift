//
//  Icecream.swift
//  [220815] swift_day_52
//
//  Created by user on 2022/08/15.
//

//import Foundation
//
//class Icecream: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case order
//    }
//    
//    @Published var order: Order = Order()
//    
//    
//    func encode(to encoder: Encoder) throws {
//        var container = try encoder.container(keyedBy: CodingKeys.self)
//        
//        container.encode(Order.self, forKey: .order)
//    }
//    
//    required init(to decoder: Decoder) throws {
//        var container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        order = try container.decode(Order.self, forKey: .order)
//    }
//}
