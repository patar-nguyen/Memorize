//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Patrick Nguyen on 2023-10-10.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
