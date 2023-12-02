//
//  SetGame.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 3.12.23..
//

import Foundation

struct SetGame {
    private let deckOfCards: [Card] = createDeckOfCards()
    private let initialCardNumber = 12
    
    var cards: [Card] {
        deckOfCards.dropLast(deckOfCards.count - initialCardNumber)
    }
    
    private static func createDeckOfCards() -> [Card] {
        var cards = [Card]()
        for color in Card.Color.allCases {
            for number in Card.Number.allCases {
                for shape in Card.Shape.allCases {
                    for shading in Card.Shading.allCases {
                        let card = Card(color: color, number: number, shape: shape, shading: shading)
                        cards.append(card)
                    }
                }
            }
        }
        return cards.shuffled()
    }
}
