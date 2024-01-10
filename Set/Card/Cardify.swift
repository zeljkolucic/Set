//
//  Cardify.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 3.12.23..
//

import SwiftUI

struct Cardify: ViewModifier {
    func body(content: Content) -> some View {
        let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        ZStack {
            base.foregroundStyle(.gray)
                .offset(x: Constants.xOffset, y: Constants.yOffset)
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .foregroundStyle(.gray)
                .background(base.fill(.white))
                .overlay(content)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let xOffset: CGFloat = -2
        static let yOffset: CGFloat = -2
        static let lineWidth: CGFloat = 1
    }
}

extension View {
    func cardify() -> some View {
        modifier(Cardify())
    }
}
