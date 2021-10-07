//
//  CardView.swift
//  Memorize
//
//  Created by Chelsea Crowson on 10/6/21.
//

import SwiftUI

struct CardView: View {
    private let card: MemoryGame<String>.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isMatched {
                shape
                    .fill(.gray)
            } else if card.isFaceUp {
                shape
                    .fill(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
    }
}
