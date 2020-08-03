//
//  MemoryGame.swift
//  Test
//
//  Created by Medyannik Dmitri on 25.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import Foundation

struct MemoryGame <CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        //self.cards = [Card(isFaceUp: false, isMatched: false, content: "q" as! CardContent)]
        self.cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            self.cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
    }
    
    func choose(card: Card) {
        print("Choose card: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
