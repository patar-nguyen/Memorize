//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Patrick Nguyen on 2023-10-10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGameViewModel
    
    let emojis = ["👻", "😈", "🕷️", "🎃", "🕸️", "💀", "☠️", "👹", "🧙", "😱", "👺", "🤡"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        //lazy uses as little space as possible while normal stacks use as much space as they can
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)

            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
