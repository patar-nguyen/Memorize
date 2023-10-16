//
//  MemorizeGameModel.swift
//  Memorize
//
//  Created by Patrick Nguyen on 2023-10-11.
//

import Foundation

//using generics, <cardcontent> can be anything
struct MemoryGameModel<CardContent> where CardContent: Equatable {
    //people can look at this model but can't set it
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))

        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { index in cards[index].isFaceUp }.only
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            } else {
//                return nil
//            }
        }
        
        set {
            return cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) }

//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
//            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
//    
//    func index(of card: Card) -> Int? {
//        for index in cards.indices {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
