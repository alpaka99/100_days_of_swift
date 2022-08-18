//
//  _220818__swift_day_55App.swift
//  [220818] swift_day_55
//
//  Created by user on 2022/08/18.
//

import SwiftUI

@main
struct _220818__swift_day_55App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
