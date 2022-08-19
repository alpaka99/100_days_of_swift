//
//  DataController.swift
//  [220819] swift_day_56
//
//  Created by user on 2022/08/19.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
               print("Cannot load Core Data")
            }
        }
    }
}
