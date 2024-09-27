//
//  FirstView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct FirstView: View {
    
    var body: some View {
        NavigationStack {
            OnboardingView(
                title: "Welcome to AI Image Generator",
                description: "Describe your idea, and our AI creates art in seconds",
                image: "first")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    VStack {
                        NavigationLink(destination: SecondView(),
                                       label: {
                            CapsuleButton(buttonTitle: "Continue")
                                .frame(width: UIScreen.main.bounds.width - 32)
                        })
                        DotsNavigationView(number: 1)
                    }
                }
            }
            
        }
    }
}

#Preview {
    FirstView()
}
