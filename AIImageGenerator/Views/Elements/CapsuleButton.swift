//
//  NewPhotoButton.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct CapsuleButton: View {
    var imageSystemName: String?
    var buttonTitle: String

    var body: some View {
        HStack {
            if let imageSystemName {
                Image(systemName: imageSystemName)
            }
            Text(buttonTitle)
        }
        .foregroundStyle(.white)
        .padding(14)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(
            Capsule()
                .foregroundStyle(Color.mainApp.gradient)
        )

    }
}

#Preview {
    CapsuleButton(imageSystemName: "photo.badge.plus", buttonTitle: "Add Photo")
}
