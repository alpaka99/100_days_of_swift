//
//  ContentView.swift
//  [220806] swift_day_44
//
//  Created by user on 2022/08/06.
//

import SwiftUI

//1. Transforming shapes using CGAffineTransform and even-odd fills
//struct Flower: Shape {
//    var petalOffset = -20.0
//    var petalWidth = 100.0
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//            let rotatedPetal = originalPetal.applying(position)
//
//            path.addPath(rotatedPetal)
//        }
//
//        return path
//    }
//}

struct ColerCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [color(for: value, brightness: 1),
                                                                   color(for: value, brightness: 0.5)
                                                                  ]), startPoint: .top, endPoint: .bottom)
                    )
                
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
    @State private var colorCycle = 0.0
    
    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(.red, lineWidth: 1)
//                .fill(.red)
//
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//
//            Text("Width")
//            Slider(value: $petalWidth, in: 0...100)
//        }
        
//        2. Creative borders and fills using ImagePaint
//        Capsule()
//            .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y:0.25, width: 1, height: 0.5), scale: 0.2), lineWidth: 50)
        
        
        VStack {
            ColerCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
        }
        
        Slider(value: $colorCycle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
