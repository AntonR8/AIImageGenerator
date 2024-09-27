//
//  AIImageGeneratorApp.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI
import TipKit


@main
struct AIImageGeneratorApp: App {
    @EnvironmentObject var vm: ViewModel
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(ViewModel())
                .task {
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
