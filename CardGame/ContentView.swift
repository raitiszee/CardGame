//
//  ContentView.swift
//  CardGame
//
//  Created by Raitis ZE on 17/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView(isFaceUp: false)
        }
        .foregroundColor(.orange)
        .padding(20)
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)
            }
            
        }
        
    }
}
