//
//  SkiDetailsView.swift
//  [221027] swift_day_98
//
//  Created by user on 2022/10/27.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
                    .font(.title)
            }
            
            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)")
                    .font(.title3)
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}
