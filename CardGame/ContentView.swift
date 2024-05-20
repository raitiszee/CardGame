//
//  ContentView.swift
//  CardGame
//
//  Created by Raitis ZE on 17/05/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🥅", "🎤", "🎸", "📀", "🏒", "🗽"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                Button("Add Card") {
                    cardCount += 1
                }
                Spacer()
                Button("Remove Card") {
                    cardCount -= 1
                }
            }
            
        }
        .padding(20)
        
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 15)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
