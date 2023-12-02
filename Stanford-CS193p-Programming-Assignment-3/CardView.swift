//
//  CardView.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 1.12.23..
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        VStack {
            ForEach(0..<number, id: \.self) { _ in
                shape
            }
        }
        .padding()
    }
    
    var shape: some View {
        Shape(shape: card.shape)
            .shaded(by: card.shading)
            .aspectRatio(aspectRatio, contentMode: .fit)
            .foregroundStyle(color)
        
    }
    
    var color: Color {
        switch card.color {
        case .green:
            return .green
        case .purple:
            return .purple
        case .pink:
            return .pink
        }
    }
    
    var number: Int {
        switch card.number {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        }
    }
    
    var aspectRatio: CGFloat {
        switch card.shape {
        case .diamond:
            return 2
        case .squiggle:
            return 3/2
        case .oval:
            return 2
        }
    }
    
    private struct Shape: SwiftUI.Shape {
        let shape: Card.Shape
        
        private let lineWidth: CGFloat = 2
        
        func path(in rect: CGRect) -> Path {
            switch shape {
            case .diamond:
                return Diamond().path(in: rect)
            case .squiggle:
                return Squiggle().path(in: rect)
            case .oval:
                return Capsule().path(in: rect)
            }
        }
        
        @ViewBuilder
        func shaded(by shading: Card.Shading) -> some View {
            switch shading {
            case .solid:
                self
            case .striped:
                striped()
            case .open:
                stroke(lineWidth: lineWidth)
            }
        }
    }
}

#Preview {
    CardView(Card(color: .green, number: .one, shape: .squiggle, shading: .solid))
}
