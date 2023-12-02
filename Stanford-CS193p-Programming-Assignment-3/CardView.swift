//
//  CardView.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 1.12.23..
//

import SwiftUI

struct CardView: View {
    enum Shading {
        case solid
        case striped
        case open
    }
    
    var body: some View {
        VStack {
            Squiggle()
                .striped()
                .foregroundStyle(.orange)
                .aspectRatio(3/2, contentMode: .fit)
            Squiggle()
                .aspectRatio(3/2, contentMode: .fit)
            Squiggle()
                .stroke(lineWidth: 4)
                .aspectRatio(3/2, contentMode: .fit)
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

#Preview {
    CardView()
}

extension Shape {
    func striped() -> some View {
        ZStack {
            Stripe()
                .stroke(lineWidth: 2)
                .clipShape(self)

            self.stroke(lineWidth: 4)
        }
    }
}

struct Stripe: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        for x in stride(from: 0, through: width, by: width / Constants.numberOfLines) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: height))
        }
        return path
    }
    
    struct Constants {
        static let numberOfLines: CGFloat = 20
    }
}
