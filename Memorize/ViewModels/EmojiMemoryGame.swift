//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chelsea Crowson on 9/28/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static var emojis = ["🍜", "🍣", "🥐", "🥖", "🥨", "🥯", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🫕", "🥣", "🥗", "🍿", "🧈", "🍱"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5) { pairIndex in
           emojis[pairIndex]
       }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<Card> {
        model.cards
    }
        
    //    MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
