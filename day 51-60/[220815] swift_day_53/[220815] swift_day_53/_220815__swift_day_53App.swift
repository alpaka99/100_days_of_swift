//
//  _220815__swift_day_53App.swift
//  [220815] swift_day_53
//
//  Created by user on 2022/08/16.
//

import SwiftUI

@main
struct _220815__swift_day_53App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
