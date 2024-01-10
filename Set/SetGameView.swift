//
//  SetGameView.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 9.11.23..
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
        
    var body: some View {
        VStack {
            cards
            actions
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .scaleEffect(card.isChosen ? 0.8 : 1)
                .onTapGesture {
                    choose(card)
                }
        }
    }
    
    private var actions: some View {
        HStack {
            drawThree
                .opacity(viewModel.deckOfCards.isEmpty ? 0 : 1)
            Spacer()
            restartGame
        }
        .padding()
        .cardify()
        .aspectRatio(7, contentMode: .fit)
    }
    
    private var drawThree: some View {
        Button(action: {
            viewModel.draw()
        }, label: {
            Text("Draw 3")
        })
    }
    
    private var restartGame: some View {
        Button(action: {
            viewModel.restartGame()
        }, label: {
            Image(systemName: "arrow.clockwise.circle")
                .imageScale(.large)
        })
    }
    
    private func choose(_ card: Card) {
        withAnimation(.easeInOut(duration: 0.2)) {
            viewModel.choose(card)
        }
    }
}

#Preview {
    SetGameView(viewModel: SetGameViewModel())
}
