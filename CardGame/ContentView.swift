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
            ScrollView{
                cards
            }
            
            Spacer()
            cardCountAdjusters
        }
        .padding(20)
        }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
        .font(.largeTitle)
    }
    
    //function to control add and remove card buttons by offset is two labels
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image (systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count) //disable button if the card count is lees than or higher than defined emojis in the array
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
       cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
