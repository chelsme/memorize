//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chelsea Crowson on 9/28/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var win: Bool = false
    private var firstCardIndex: Int?
    
    mutating func choose(_ card: Card) {
        if let selectedCardIndex: Int = cards.firstIndex(where: {$0.id == card.id}),
           !cards[selectedCardIndex].isMatched,
           !cards[selectedCardIndex].isFaceUp
        {
            if firstCardIndex != nil {
                if cards[firstCardIndex!].content == cards[selectedCardIndex].content {
                    cards[firstCardIndex!].isMatched = true
                    cards[selectedCardIndex].isMatched = true
                }
                firstCardIndex = nil
                if (cards.firstIndex(where: {$0.isMatched == false}) == nil) {
                    win = true
                    cards.removeAll()
                    for card in 1...5 {
                        cards.append(Card(isFaceUp: true, content: "Win" as! CardContent, id: card ))
                    }
                }
            } else {
                for index in cards.indices {
                    if !cards[index].isMatched {
                        cards[index].isFaceUp = false
                    }
                }
                firstCardIndex = selectedCardIndex
            }
            if win == false {
                cards[selectedCardIndex].isFaceUp.toggle()
            }
        }
    }
    
    init (numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
