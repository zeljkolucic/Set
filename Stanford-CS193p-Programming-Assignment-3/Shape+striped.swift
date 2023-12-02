//
//  Shape+striped.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 2.12.23..
//

import SwiftUI

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
