//
//  StyleButton.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct StyleButton: View {
    @EnvironmentObject var vm: ViewModel
    var styleName: ImageStyle
   

    func returnStyleName() -> String {
        switch styleName {
        case .art: return "🖌 Art"
        case .photo: return "🖼️ Photo"
        case .drawingStyle: return "🧑‍🎨 Drawing"
        case .none: return "🏳️ None"
        }

    }

    var body: some View {
        Button(action: {
            vm.styleChosen = styleName
        }, label: {
            Text(returnStyleName())
                .foregroundStyle(.white)
                .font(.callout)
                .frame(height: 40)
                .padding(.horizontal)
                .overlay {
                    Capsule()
                        .stroke(vm.styleChosen == styleName ? .accent : .gray)
                }
        })



    }
}

#Preview {
    StyleButton(styleName: .drawingStyle)
        .environmentObject(ViewModel())
}
