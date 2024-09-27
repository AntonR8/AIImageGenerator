//
//  ThirdView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        OnboardingView(
            title: "Simplify Your Editing Process",
            description: "Remove backgrounds instantly with one tap",
            image: "third"
        )
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                VStack {
                    NavigationLink(destination: ForthView(),
                                   label: {
                        CapsuleButton(buttonTitle: "Continue")
                            .frame(width: UIScreen.main.bounds.width - 32)
                    })
                    DotsNavigationView(number: 3)
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    ThirdView()
}
