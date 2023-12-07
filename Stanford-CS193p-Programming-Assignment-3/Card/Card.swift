//
//  Card.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 3.12.23..
//

import Foundation

struct Card: Identifiable {
    enum Color: CaseIterable {
        case green
        case purple
        case pink
    }
    
    enum Number: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }
    
    enum Shape: CaseIterable {
        case diamond
        case squiggle
        case oval
    }
    
    enum Shading: CaseIterable {
        case solid
        case striped
        case open
    }
    
    let id = UUID()
    let color: Color
    let number: Number
    let shape: Shape
    let shading: Shading
}
