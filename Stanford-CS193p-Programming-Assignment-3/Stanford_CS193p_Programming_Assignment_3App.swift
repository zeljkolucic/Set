//
//  Stanford_CS193p_Programming_Assignment_3App.swift
//  Stanford-CS193p-Programming-Assignment-3
//
//  Created by Zeljko Lucic on 9.11.23..
//

import SwiftUI

@main
struct Stanford_CS193p_Programming_Assignment_3App: App {
    @StateObject var game = SetGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            SetGameView(viewModel: game)
        }
    }
}
