//
//  Card.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 3.12.23..
//

import Foundation

struct Card {
    enum Color {
        case green
        case purple
        case pink
    }
    
    enum Number {
        case one
        case two
        case three
    }
    
    enum Shape {
        case diamond
        case squiggle
        case oval
    }
    
    enum Shading {
        case solid
        case striped
        case open
    }
    
    let color: Color
    let number: Number
    let shape: Shape
    let shading: Shading
}
