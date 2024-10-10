//
//  MenuElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 10.10.2024.
//

import SwiftUI

struct MenuElementView2: View {
    let image: String
    let title: String

    var body: some View {
        Label(
            title: { Text("Rate our app") },
            icon: { Image(systemName: "star.bubble") }
        )
    }
}

struct MenuElementView: View {
    let image: String
    let title: String
    let noChevron: Bool

    init(image: String, title: String, noChevron: Bool = false) {
        self.image = image
        self.title = title
        self.noChevron = noChevron
    }

    var body: some View {
        HStack(alignment: .bottom) {
            Image(systemName: image)
                .foregroundStyle(.accent)
                .font(.title3)
                .frame(width: 25)
            Text(title)
                .padding(.horizontal, 8)
            Spacer()
            if !noChevron {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.tertiary)
            }
        }
    }
}

#Preview {
    VStack {
        MenuElementView(image: "star.bubble", title: "Rate our app")
        MenuElementView2(image: "Rate our app", title: "star.bubble")
    }
}
