//
//  GridElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct HardCodeGridElementView: View {
    @EnvironmentObject var vm: ViewModel
    let image: HardCodeImageModel

    var body: some View {
        NavigationLink(destination: {
            HardCodeImageView(image: image)
        }, label: {
            ZStack {
                Image(image.imageName)
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                if image.saved {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                                .padding(10)
                                .background(
                                    Circle()
                                        .fill(.black.opacity(0.5))
                                )
                            Spacer()
                        }
                    }
                    .padding(10)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.gray.opacity(0.2))
            )
        })
    }
}



#Preview {
    NavigationStack {
        ScrollView(showsIndicators: false) {
            HardCodeGridView(arrayOfImages: [
                HardCodeImageModel(imageName: "image1", prompt: "", style: .none),
                HardCodeImageModel(imageName: "image2", prompt: "", style: .none)
            ])
        }
    }
    .environmentObject(ViewModel())
}
