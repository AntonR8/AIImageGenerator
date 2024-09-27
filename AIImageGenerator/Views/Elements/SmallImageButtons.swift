//
//  SmallImageButtons.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct SmallImageButton: View {
    var systemName: String?
    var title: String?
    var foregroundStyle: Color
    var backGroundStyle: Color = .gray.opacity(0.5)

    var body: some View {
        if let systemName {
            Image(systemName: systemName)
                .foregroundStyle(foregroundStyle)
                .padding(8)
                .background(
                    Circle()
                        .fill(backGroundStyle)
                )
        } else if let title {
            Text(title)
                .foregroundStyle(foregroundStyle)
                .padding(.horizontal, 8)
                .padding(8)
                .background(
                    Capsule()
                        .fill(backGroundStyle)
                )
        }


    }
}

#Preview {
//    SmallImageButton(systemName: "arrow.down.to.line", foregroundStyle: .white)

    SmallImageButton(title: "Restore", foregroundStyle: .white)
        .background(Color.red)
}
