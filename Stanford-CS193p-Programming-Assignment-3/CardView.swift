//
//  CardView.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 1.12.23..
//

import SwiftUI

struct CardView: View {
    var body: some View {
        GeometryReader { geometry in
            Squiggle()
                .foregroundStyle(.orange)
                .aspectRatio(3/2, contentMode: .fit)
        }
    }
}

#Preview {
    CardView()
}
