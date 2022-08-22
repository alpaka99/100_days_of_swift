//
//  _220821__swift_day_58App.swift
//  [220821] swift_day_58
//
//  Created by user on 2022/08/22.
//

import SwiftUI

@main
struct _220821__swift_day_58App: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
