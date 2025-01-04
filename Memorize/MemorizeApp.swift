//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ania on 02/01/2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var emojiMemoryGame = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: emojiMemoryGame)
        }
    }
}
