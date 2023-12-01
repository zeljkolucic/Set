//
//  CardView.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 1.12.23..
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Diamond()
                .aspectRatio(2/1, contentMode: .fit)
        }
    }
}

#Preview {
    CardView()
}
