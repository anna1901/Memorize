//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ania on 02/01/2025.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Game = MemoryGame<String>
    
    private static let emojis = Themes.halloween.emojisArray
        
    
    private static func makeMemoryGame() -> Game {
        Game(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }
    
    @Published private var game: Game = makeMemoryGame()
    
    var cards: [Game.Card] {
        game.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: Game.Card) {
        game.choose(card: card)
    }
    
    func shuffle() {
        game.shuffle()
    }
    
    func setTheme(_ theme: Themes) {
        
    }
}

enum Themes: CaseIterable {
    case halloween, medicine, zen, music
    
    var emojis: [String] {
        var selectedEmojis = emojisArray
        selectedEmojis.append(contentsOf: selectedEmojis)
        return selectedEmojis.shuffled()
    }
    
    var buttonEmoji: String {
        emojisArray.first ?? "🩷"
    }
    
    var buttonText: String {
        switch self {
        case .halloween:
            "Halloween"
        case .medicine:
            "Medicine"
        case .zen:
            "Zen"
        case .music:
            "Music"
        }
    }
    
    var emojisArray: [String] {
        switch self {
        case .halloween:
            ["👻", "🎃", "😈", "💀", "👽", "🧟", "🥷🏻", "🕸️", "🕷️", "🦇", "🔪", "🪦", "🔮"]
        case .medicine:
            ["💊", "😷", "🤒", "🤕", "🦵🏻", "🦷", "👂🏻", "👁️", "🫀", "🫁", "🧠", "🧬", "💉","🩺"]
        case .zen:
            ["🧿", "🪬", "🔮", "🩷", "🎈", "🧘🏻‍♀️", "🌸", "🪷", "🧠", "🫶🏻", "👁️", "💆🏻‍♀️", "🦋", "🥑", "🏄🏻‍♀️"]
        case .music:
            ["🪈", "🎻", "🪕", "🎸", "🪗", "🎷", "🎺", "🪘", "🥁", "🪇", "🎹", "🎼", "🎧", "🎤"]
        }
    }
}
