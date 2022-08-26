//
//  ContentView.swift
//  [220826] swift_day_59
//
//  Created by user on 2022/08/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tests: FetchedResults<Test>
    var body: some View {
        
        VStack {
            FetchedList(filter: "test5")
            Button("Add Items") {
                let test1 = Test(context: moc)
                test1.name = "test1"
                test1.id = UUID()
                
                let test2 = Test(context: moc)
                test2.name = "test2"
                test2.id = UUID()
                
                let test3 = Test(context: moc)
                test3.name = "test3"
                test3.id = UUID()
                
                let test4 = Test(context: moc)
                test4.name = "test4"
                test4.id = UUID()
                
                let test5 = Test(context: moc)
                test5.name = "test5"
                test5.id = UUID()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
