//
//  MemorizeGameModel.swift
//  Memorize
//
//  Created by Patrick Nguyen on 2023-10-11.
//

import Foundation

struct MemoryGame<CardContent>{
    var card: [Card]
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
