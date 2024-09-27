//
//  PrivacyPolicyLinksView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct PrivacyPolicyLinksView: View {
    let contactURL = URL(string: "https://www.termsfeed.com/live/bbc6cbdc-1b4f-463c-9d61-dd3acb21a3b9")!
    var body: some View {
        HStack {
                Link("Privacy Policy", destination: contactURL)
                    .foregroundStyle(.tertiary)
                Spacer()
                Text("Cancel Anytime")
                    .foregroundStyle(.secondary)
                Spacer()
                Link("Terms of Use", destination: contactURL)
                    .foregroundStyle(.tertiary)
            }
            .font(.caption)
    }
}

#Preview {
    PrivacyPolicyLinksView()
}
