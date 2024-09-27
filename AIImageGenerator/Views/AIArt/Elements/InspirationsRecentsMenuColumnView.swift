//
//  MenuColumnView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct InspirationsRecentsMenuColumnView: View {
    @EnvironmentObject var vm: ViewModel
    let title: String
    let inspirationChosen: Bool

    var body: some View {
        VStack(spacing: -4) {
            Button(action: {
                vm.inspirationChosen = inspirationChosen
            }, label: {
                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
            })


            Text(title)
                .font(.title3)
                .bold()
                .foregroundStyle(.clear)
                .overlay {
                    if (title == "Inspirations" && vm.inspirationChosen) || (title == "Recents" && !vm.inspirationChosen) {
                        Color.accentColor.frame(height: 1)
                    }

                }
        }
    }
}

#Preview {
    InspirationsRecentsMenuColumnView(title: "Inspirations", inspirationChosen: true)
        .environmentObject(ViewModel())
}
