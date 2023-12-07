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
            AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
                CardView(card)
                    .padding(spacing)
            }
            drawButton
                .opacity(viewModel.deckOfCards.isEmpty ? 0 : 1)
        }
        .padding()
    }
    
    private var drawButton: some View {
        Button(action: {
            viewModel.draw()
        }, label: {
            Text("Draw 3")
        })
    }
}

#Preview {
    SetGameView(viewModel: SetGameViewModel())
}
