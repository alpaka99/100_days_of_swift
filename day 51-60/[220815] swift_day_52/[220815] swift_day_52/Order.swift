//
//  Order.swift
//  [220815] swift_day_52
//
//  Created by user on 2022/08/15.
//

import Foundation

struct Order: Codable {
    static let types: [String] = ["Strawberry", "Orange", "Chocolate", "Cheesecake"]
    
    var type: Int = 0
    var quantity: Int = 0

    
    var specialOptions: Bool = false {
        didSet {
            if specialOptions == false {
                extraFrostings = false
                addSprinkles = false
            }
        }
    }
    var extraFrostings: Bool = false
    var addSprinkles: Bool = false
    
    enum CodingKeys: String, CodingKey {
//        case types
        case type
        case quantity
        
        case specialOptions = "special_options"
        case extraFrostings = "extra_frostings"
        case addSprinkles = "add_sprinkles"
    }
}
