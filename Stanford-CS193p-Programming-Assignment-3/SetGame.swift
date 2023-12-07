//
//  SetGame.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 3.12.23..
//

import Foundation

struct SetGame {
    private let initialNumberOfCards = 12
    private let numberOfCardsToDraw = 3
    
    var deckOfCards: [Card]
    var cards: [Card]
    
    init() {
        deckOfCards = [Card]()
        for color in Card.Color.allCases {
            for number in Card.Number.allCases {
                for shape in Card.Shape.allCases {
                    for shading in Card.Shading.allCases {
                        let card = Card(color: color, number: number, shape: shape, shading: shading)
                        deckOfCards.append(card)
                    }
                }
            }
        }
        deckOfCards.shuffle()
        cards = deckOfCards.draw(initialNumberOfCards)
    }
    
    mutating func draw() {
        let drawnCards = deckOfCards.draw(numberOfCardsToDraw)
        cards += drawnCards
    }
}

extension Array where Element == Card {
    mutating func draw(_ numberOfCards: Int) -> [Card] {
        guard numberOfCards <= count else { return [] }
        
        let drawnCards = prefix(numberOfCards)
        removeFirst(numberOfCards)
        return Array(drawnCards)
    }
}
