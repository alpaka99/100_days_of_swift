//
//  DetailView.swift
//  [220828] swift_day_60
//
//  Created by user on 2022/08/28.
//

import SwiftUI

struct DetailView: View {
    @State var user: User
    
    var body: some View {
        List {
            Section {
                Text(user.name)
            }
            
            Section {
                Text(user.isActive ? "true" : "false")
                Text("\(user.age)")
                Text(user.address)
                Text(user.about)
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
