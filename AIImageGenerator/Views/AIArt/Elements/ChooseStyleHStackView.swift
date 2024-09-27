//
//  ChooseStyleHStackView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct ChooseStyleHStackView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                StyleButton(styleName: .art)
                StyleButton(styleName: .photo)
                StyleButton(styleName: .drawingStyle)
                StyleButton(styleName: .none)
            }
        }
    }
}

#Preview {
    ChooseStyleHStackView()
}
