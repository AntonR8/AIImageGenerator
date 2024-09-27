//
//  FirstView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct OnboardingView: View, Hashable {
    let title: String
    let description: String
    let image: String

    var body: some View {
            VStack(alignment: .center) {
                Text(title)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)

                Text(description)
                    .multilineTextAlignment(.center)
                    .padding(4)
                Image(image)
                    .resizable()
                    .scaledToFit()

            }
        }

}

#Preview {
    NavigationStack {
        OnboardingView(title: "Welcome to AI Image Generator", description: "Describe your idea, and our AI creates art in seconds", image: "first")
    }
}
