//
//  _220819__swift_day_56App.swift
//  [220819] swift_day_56
//
//  Created by user on 2022/08/19.
//

import SwiftUI

@main
struct _220819__swift_day_56App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
