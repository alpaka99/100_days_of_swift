//
//  DetailView.swift
//  [220829] swift_day_61
//
//  Created by user on 2022/08/29.
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
                Text("\(user.age)")
                Text(user.company)
                Text(user.email)
                Text(user.address)
            }
            
            Section {
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
