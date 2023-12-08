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
    private let maximumNumberOfChosenCards = 3
    
    var deckOfCards: [Card]
    var cards: [Card]
    
    var chosenCards: [Card] {
        cards.filter { $0.isChosen }
    }
    
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
    
    mutating func choose(_ card: Card) {
        guard chosenCards.count < maximumNumberOfChosenCards else { return }
        
        if card.isChosen, let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            return cards[chosenIndex].isChosen = false
        }
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isChosen = true
            if chosenCards.count == maximumNumberOfChosenCards {
                if checkForMatch(chosenCards) {
                    removeMatchedCards()
                }
            }
        }
    }
    
    private func checkForMatch(_ cards: [Card]) -> Bool {
        return true
    }
    
    private mutating func removeMatchedCards() {
        for card in cards where card.isChosen {
            if let matchedIndex = cards.firstIndex(where: { $0.id == card.id }) {
                cards.remove(at: matchedIndex)
            }
        }
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
