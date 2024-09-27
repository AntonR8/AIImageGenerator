//
//  RemoveBGView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct RemoveBGView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.gray.tertiary)
                VStack {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.system(size: 72))
                        .foregroundStyle(.tertiary)
                   CapsuleButton(imageSystemName: "photo.badge.plus", buttonTitle: "Add Photo")
                        .padding(.vertical, 6)
                    TakeAPhotoButton()

                }
                .padding(50)
                .navigationTitle("Remove BG")
            }

        }
    }
}

#Preview {
    RemoveBGView()
        .environmentObject(ViewModel())
}
