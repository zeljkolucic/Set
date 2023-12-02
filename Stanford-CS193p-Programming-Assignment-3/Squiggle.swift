//
//  Squiggle.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 1.12.23..
//

import SwiftUI
import CoreGraphics

struct Squiggle: SwiftUI.Shape {
    func path(in rect: CGRect) -> Path {
        let startPoint = CGPoint(x: 0.9252669 * rect.width, y: 0.22865854 * rect.height)
        let points = [
            (
                point: CGPoint(x: 0.56049822 * rect.width, y: 0.82317073 * rect.height),
                control1: CGPoint(x: rect.width, y: 0.5625 * rect.height),
                control2: CGPoint(x: 0.7980427 * rect.width, y: 0.92682927 * rect.height)
            ),
            (
                point: CGPoint(x: 0.24021352 * rect.width, y: 0.80792683 * rect.height),
                control1: CGPoint(x: 0.46530249 * rect.width, y: 0.7820122 * rect.height),
                control2: CGPoint(x: 0.37544484 * rect.width, y: 0.6402439 * rect.height)
            ),
            (
                point: CGPoint(x: 0.04448399 * rect.width, y: 0.6097561 * rect.height),
                control1: CGPoint(x: 0.08540925 * rect.width, y: rect.height),
                control2: CGPoint(x: 0.0480427 * rect.width, y: 0.88871951 * rect.height)
            ),
            (
                point: CGPoint(x: 0.3202847 * rect.width, y: 0.18292683 * rect.height),
                control1: CGPoint(x: 0.04092527 * rect.width, y: 0.33536585 * rect.height),
                control2: CGPoint(x: 0.16992883 * rect.width, y: 0.14786585 * rect.height)
            ),
            (
                point: CGPoint(x: 0.79181495 * rect.width, y: 0.21341463 * rect.height),
                control1: CGPoint(x: 0.52935943 * rect.width, y: 0.23170732 * rect.height),
                control2: CGPoint(x: 0.55071174 * rect.width, y: 0.48018293 * rect.height)
            ),
            (
                point: startPoint,
                control1: CGPoint(x: 0.84786477 * rect.width, y: 0.15243902 * rect.height),
                control2: CGPoint(x: 0.89768683 * rect.width, y: 0.10518293 * rect.height)
            )
        ]
        
        var path = Path()
        path.move(to: startPoint)
        for (point, control1, control2) in points {
            path.addCurve(to: point, control1: control1, control2: control2)
        }
        
        return path
    }
}
