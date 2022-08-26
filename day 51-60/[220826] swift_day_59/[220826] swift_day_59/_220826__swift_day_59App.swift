//
//  _220826__swift_day_59App.swift
//  [220826] swift_day_59
//
//  Created by user on 2022/08/26.
//

import SwiftUI

@main
struct _220826__swift_day_59App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
