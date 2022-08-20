//
//  _220820__swift_day_57App.swift
//  [220820] swift_day_57
//
//  Created by user on 2022/08/20.
//

import SwiftUI

@main
struct _220820__swift_day_57App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
