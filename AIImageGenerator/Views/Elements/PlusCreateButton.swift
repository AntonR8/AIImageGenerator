//
//  CreateButton.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct PlusCreateButton: View {
    var body: some View {
        Capsule()
            .frame(width: 108, height: 48)
            .foregroundStyle(Color.accentColor.gradient)
            .overlay {
                HStack {
                    Image(systemName: "plus")
                    Text("Create")
                }
                .foregroundStyle(.white)
                .font(.callout)
                
            }
    }
}

#Preview {
    PlusCreateButton()
}
