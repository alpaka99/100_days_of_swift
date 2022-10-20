//
//  ContentView.swift
//  [221020] swift_day_92
//
//  Created by user on 2022/10/20.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
//        VStack(alignment: .leading) {
//            ForEach(0..<10) { position in
//                Text("Number \(position)")
//                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10}
//            }
//        }
//        .background(.red)
//        .frame(width: 400, height: 400)
//        .background(.blue)
        
        HStack(alignment: .midAccountName) {
            VStack {
                Text("@dev.tenev")
                    .alignmentGuide(.midAccountName) { d in d[VerticalAlignment.center]}
                Image("Example")
                    .resizable()
                    .frame(width: 64, height: 64)
                Text("@dev.tenev")
                Text("@dev.tenev")
                Text("@dev.tenev")
                Text("@dev.tenev")
                Text("@dev.tenev")
                Text("@dev.tenev")
            }
            
            VStack {
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("Full name:")
                Text("DEV.TENEV")
                    .alignmentGuide(.midAccountName) { d in d[VerticalAlignment.center]}
                    .font(.largeTitle)
                
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
