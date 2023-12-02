//
//  SetGameViewModel.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 3.12.23..
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var game = SetGame()
    
    var cards: [Card] {
        game.cards
    }
}
