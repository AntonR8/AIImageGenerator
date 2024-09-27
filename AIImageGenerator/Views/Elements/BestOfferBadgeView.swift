//
//  BestOfferBadgeView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct BestOfferBadgeView: View {
    var body: some View {
        Text("BEST OFFER")
            .font(.caption2)
            .bold()
            .padding(4)
            .padding(.horizontal, 6)
            .foregroundStyle(.white)
            .background(
                Capsule()
                    .foregroundStyle(Color.accentColor.gradient)
        )
    }
}

#Preview {
    BestOfferBadgeView()
}
