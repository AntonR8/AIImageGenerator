//
//  ProButtonView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct ProButtonView: View {
    var title = "PRO"

    var body: some View {
        HStack {
            Image(systemName: "crown.fill")
                .font(.caption)
            Text(title)
                .bold()
        }
        .padding(6)
        .padding(.horizontal, 6)
        .foregroundStyle(.white)
        .background(
            Capsule()
                .foregroundStyle(Color.accentColor.gradient)
        )
    }
}

#Preview {
    ProButtonView()
}
