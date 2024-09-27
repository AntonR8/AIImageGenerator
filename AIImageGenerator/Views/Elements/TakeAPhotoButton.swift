//
//  TakeAPhotoButton.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct TakeAPhotoButton: View {
    var body: some View {
        Capsule()
            .frame(height: 48)
            .foregroundStyle(Color.gray.opacity(0.3))
            .overlay {
                HStack {
                    Image(systemName: "camera")
                    Text("Take a photo")
                }
                .foregroundStyle(.white)
                .font(.callout)

            }
    }
}

#Preview {
    TakeAPhotoButton()
}
