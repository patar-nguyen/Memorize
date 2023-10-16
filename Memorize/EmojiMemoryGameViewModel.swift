//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Patrick Nguyen on 2023-10-11.
//

import Foundation
import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    typealias Card = MemoryGameModel<String>.Card
    
    private static let emojis = ["👻", "😈", "🕷️", "🎃", "🕸️", "💀", "☠️", "👹", "🧙", "😱", "👺", "🤡"]
    
//    private var model = MemoryGameModel(numberOfPairsOfCards: 4) { pairIndex in
//        return emojis[pairIndex]
//    }
    
    @Published private var model = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        return MemoryGameModel(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    var cards: [Card] {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
