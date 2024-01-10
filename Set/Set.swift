//
//  Set.swift
//  Set
//
//  Created by Zeljko Lucic on 9.11.23..
//

import SwiftUI

@main
struct Set: App {
    @StateObject var game = SetGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            SetGameView(viewModel: game)
        }
    }
}
