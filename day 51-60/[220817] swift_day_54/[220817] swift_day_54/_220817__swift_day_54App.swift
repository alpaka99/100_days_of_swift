//
//  _220817__swift_day_54App.swift
//  [220817] swift_day_54
//
//  Created by user on 2022/08/17.
//

import SwiftUI

@main
struct _220817__swift_day_54App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
