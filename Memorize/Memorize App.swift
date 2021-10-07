//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Chelsea Crowson on 9/28/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiGameView(game: game)
        }
    }
}
