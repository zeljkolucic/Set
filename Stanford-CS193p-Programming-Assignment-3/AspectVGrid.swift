//
//  AspectVGrid.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 3.12.23..
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    private let items: [Item]
    private let aspectRatio: CGFloat
    private let content: (Item) -> ItemView
    
    private let maximumNumberOfItemsPerRow: CGFloat = 6
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let (gridItemSize, sizeThatFits) = gridItemWidthThatFits(count: items.count, size: geometry.size, atAspectRatio: aspectRatio, withinMaximumNumberOfItemsPerRow: maximumNumberOfItemsPerRow)
            if sizeThatFits {
                itemsGrid(withGridItemSize: gridItemSize)
            } else {
                ScrollView {
                    itemsGrid(withGridItemSize: gridItemSize)
                }
            }
        }
    }
    
    private func itemsGrid(withGridItemSize gridItemSize: CGFloat) -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
            ForEach(items) { item in
                content(item)
                    .aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
    
    private func gridItemWidthThatFits(count: Int, size: CGSize, atAspectRatio aspectRatio: CGFloat, withinMaximumNumberOfItemsPerRow maximumNumberOfItemsPerRow: CGFloat) -> (width: CGFloat, sizeThatFits: Bool) {
        let count = CGFloat(count)
        var columnCount = 1.0
        
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return (width: width.rounded(.down), sizeThatFits: true)
            } else if columnCount + 1 > maximumNumberOfItemsPerRow {
                return (width: width.rounded(.down), sizeThatFits: false)
            }
            
            columnCount += 1
        } while columnCount < count
        
        return (width: min(size.width / count, size.height * aspectRatio).rounded(.down), sizeThatFits: true)
    }
}
