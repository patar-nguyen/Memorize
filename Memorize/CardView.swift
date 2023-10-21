//
//  CardView.swift
//  Memorize
//
//  Created by Patrick Nguyen on 2023-10-16.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGameModel<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(0.4)
                    .overlay(cardContents.padding(5))
                    .padding(5)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.opacity)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: 200))
            .minimumScaleFactor(0.01)
            .multilineTextAlignment(.center)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1), value: card.isMatched)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(isFaceUp: true, content: "X", id: "test1"))
                CardView(Card(content: "X", id: "test1"))
            }
            HStack {
                CardView(Card(isFaceUp: true, content: "X", id: "test1"))
                CardView(Card(isMatched: true, content: "X", id: "test1"))

            }
        }
        .padding()
        .foregroundColor(.green)
    }
}

//#Preview {
//    typealias Card = CardView.Card
//    CardView(Card(content: "X", id: "test1"))
//        .padding()
//        .foregroundColor(.green)
//}
