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
            ZStack {
                OnboardingView(
                    title: "Welcome to AI Image Generator",
                    description: "Describe your idea, and our AI creates art in seconds",
                    image: "first")
                VStack {
                    Spacer()
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

#Preview {
    FirstView()
}
