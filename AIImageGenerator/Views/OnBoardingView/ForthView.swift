//
//  ForthView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI
import StoreKit

struct ForthView: View {
    @Environment(\.requestReview) var requestReview
    @State var raitingRequested = false



    var body: some View {
        OnboardingView(
            title: "Lots of positive reviews!",
            description: "Leave a review and help us improve",
            image: "forth"
        )
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                VStack {
                    NavigationLink(destination: FifthView(),
                                   label: {
                        CapsuleButton(buttonTitle: "Continue")
                            .frame(width: UIScreen.main.bounds.width - 32)
                    })
                    .disabled(!raitingRequested)
                    .onTapGesture {
                        requestReview()
                        raitingRequested = true
                    }
                    DotsNavigationView(number: 4)
                }

            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    ForthView()
}
