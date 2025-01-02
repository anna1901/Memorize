//
//  ContentView.swift
//  Memorize
//
//  Created by Ania on 02/01/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "😈", "💀", "👽", "🧟", "🥷🏻", "🕸️", "🕷️", "🦇", "🔪", "🪦", "🔮"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjusters
        }
        .padding()
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    private var cardAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .font(.largeTitle)
    }
    
    private var cardRemover: some View {
        Button("-") {
            if cardCount > 0 {
                cardCount -= 1
            }
        }
    }
    
    private var cardAdder: some View {
        Button("+") {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
                base.fill(Color.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            if !isFaceUp {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
