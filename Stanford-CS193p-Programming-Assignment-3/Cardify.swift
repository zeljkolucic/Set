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
        base.strokeBorder(lineWidth: Constants.lineWidth)
            .background(base.fill(.white))
            .overlay(content)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify() -> some View {
        modifier(Cardify())
    }
}
