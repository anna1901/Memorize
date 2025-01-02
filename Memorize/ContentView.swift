//
//  ContentView.swift
//  Memorize
//
//  Created by Ania on 02/01/2025.
//

import SwiftUI

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
    
    private var emojisArray: [String] {
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

struct ContentView: View {
    @State var emojis = Themes.zen.emojis
    
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
            themeSelectionButtons
        }
        .padding()
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    private var themeSelectionButtons: some View {
        HStack(spacing: 20) {
            ForEach(Themes.allCases, id: \.self) { theme in
                Button {
                    emojis = theme.emojis
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
    let content: String
    @State var isFaceUp = false
    
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
