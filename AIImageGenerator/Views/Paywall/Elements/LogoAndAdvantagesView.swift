//
//  AdvantagesView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct LogoAndAdvantagesView: View {
    var body: some View {
        ProButtonView()
            .padding()
        Image("logo")
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 50)
        Text("Unlock all features with Pro")
        VStack(alignment: .leading, spacing: 10) {
            Label(
                title: { Text("Fast processing") },
                icon: { Image(systemName: "checkmark.circle.fill") }
            )
            Label(
                title: { Text("Unlimited artwork creation") },
                icon: { Image(systemName: "checkmark.circle.fill") }
            )
            Label(
                title: { Text("Increase image size by 2x") },
                icon: { Image(systemName: "checkmark.circle.fill") }
            )
            Label(
                title: { Text("Unlimited background removal") },
                icon: { Image(systemName: "checkmark.circle.fill") }
            )
        }
        .padding(.vertical)
    }
}

#Preview {
    LogoAndAdvantagesView()
}
