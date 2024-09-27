//
//  SecondView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        OnboardingView(
            title: "Find Inspiration Everywhere!",
            description: "Browse thousands of AI images and get inspired",
            image: "second"
        )
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                VStack {
                    NavigationLink(destination: ThirdView(),
                                   label: {
                        CapsuleButton(buttonTitle: "Continue")
                            .frame(width: UIScreen.main.bounds.width - 32)
                    })
                    DotsNavigationView(number: 2)
                }
            }
        }
        .navigationBarBackButtonHidden(true)






        
    }
}

#Preview {
    SecondView()
}
