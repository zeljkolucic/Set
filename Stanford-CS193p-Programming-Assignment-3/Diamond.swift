//
//  Diamond.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 1.12.23..
//

import SwiftUI
import CoreGraphics

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let leftCorner = CGPoint(x: rect.minX, y: rect.midY)
        let topCorner = CGPoint(x: rect.midX, y: rect.minY)
        let rightCorner = CGPoint(x: rect.maxX, y: rect.midY)
        let bottomCorner = CGPoint(x: rect.midX, y: rect.maxY)
        
        var path = Path()
        path.move(to: leftCorner)
        path.addLine(to: topCorner)
        path.addLine(to: rightCorner)
        path.addLine(to: bottomCorner)
        path.addLine(to: leftCorner)
        return path
    }
}
