//
//  NegativeWordsMenuView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct NegativeWordsMenuView: View {
    @Binding var shownegativeTextField: Bool

    var body: some View {
        HStack {
            Text("Negative words")
                .font(.headline)
            Text("Optional")
                .font(.caption)
                .foregroundStyle(.secondary)
            Spacer()
            Text(shownegativeTextField ? "Collapse" : "Open")
                .foregroundStyle(.secondary)
            Button(action: {
                withAnimation(.easeInOut) {
                    shownegativeTextField.toggle()
                }
            }, label: {
                Image(systemName: shownegativeTextField ? "chevron.down" : "chevron.up")
            })
        }
        .padding(.top)
    }
}

#Preview {
    NegativeWordsMenuView(shownegativeTextField: .constant(true))
}
