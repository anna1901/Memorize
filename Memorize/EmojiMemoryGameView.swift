//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ania on 02/01/2025.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundStyle(.brown)
                .fontWeight(.black)
            ScrollView {
                cards
            }
            Spacer()
            HStack {
                Button("Shuffle") {
                    viewModel.shuffle()
                }
                themeSelectionButtons
            }
        }
        .padding()
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(.orange)
    }
    
    private var themeSelectionButtons: some View {
        HStack(spacing: 20) {
            ForEach(Themes.allCases, id: \.self) { theme in
                Button {
                    viewModel.setTheme(theme)
                } label: {
                    VStack {
                        Text(theme.buttonEmoji)
                        Text(theme.buttonText)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.fill(Color.white)
            base.strokeBorder(lineWidth: 2)
            Text(card.content)
                .font(.system(size: 200))
                .minimumScaleFactor(0.01)
                .aspectRatio(1, contentMode: .fit)
            if !card.isFaceUp {
                base.fill()
            }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
