//
//  FetchedList.swift
//  [220826] swift_day_59
//
//  Created by user on 2022/08/26.
//

import SwiftUI

struct FetchedList: View {
    @FetchRequest var fetchRequest: FetchedResults<Test>
    
    var body: some View {
        List(fetchRequest, id: \.self) { test in
            Text(test.name ?? "Unknown test")
        }
    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Test>(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", filter))
    }
}

//struct FetchedList_Previews: PreviewProvider {
//    static var previews: some View {
//        FetchedList()
//    }
//}
