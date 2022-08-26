//
//  DataController.swift
//  [220826] swift_day_59
//
//  Created by user on 2022/08/26.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Cannot load Core Data: \(error.localizedDescription)")
            }
            
        }
    }
}
