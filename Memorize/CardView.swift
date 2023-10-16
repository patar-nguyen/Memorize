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
        Pie(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay(
        Text(card.content)
            .font(.system(size: 200))
            .minimumScaleFactor(0.01)
            .multilineTextAlignment(.center)
            .aspectRatio(1, contentMode: .fit)
            .padding(5)
        )
        .padding(5)
        .cardify(isFaceUp: card.isFaceUp)
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
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
