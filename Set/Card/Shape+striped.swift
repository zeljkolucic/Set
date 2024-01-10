//
//  Shape+striped.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 2.12.23..
//

import SwiftUI

extension Shape {
    func striped(lineWidth: CGFloat) -> some View {
        ZStack {
            Stripe()
                .stroke(lineWidth: 1)
                .clipShape(self)

            self.stroke(lineWidth: lineWidth)
        }
    }
}

struct Stripe: Shape {
    func path(in rect: CGRect) -> Path {
        guard rect.width != 0, rect.height != 0 else {
            return Path()
        }
        
        var path = Path()
        for x in stride(from: 0, through: rect.width, by: rect.width / Constants.numberOfLines) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.height))
        }
        return path
    }
    
    private struct Constants {
        static let numberOfLines: CGFloat = 20
    }
}
