//
//  CardView.swift
//  [221018] swift_day_90
//
//  Created by user on 2022/10/18.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var removal: (() -> Void)? = nil
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    @State private var feedBack = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35, style: .continuous)
                .fill(
                    differentiateWithoutColor
                    ?.white
                    : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    differentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width >= 0 ? .green : .red)
                        
                )
                .shadow(radius: 10)
            
            
            VStack {
                if voiceOverEnabled{
                    Text(isShowingAnswer  ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                }
                
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    feedBack.prepare()
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        // remove the card
                        if offset.width < 0 {
                            feedBack.notificationOccurred(.error)
                        }
                        
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
