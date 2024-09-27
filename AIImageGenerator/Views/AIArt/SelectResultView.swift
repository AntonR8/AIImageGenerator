//
//  SelectResultView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct SelectResultView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
//        ScrollView(showsIndicators: false) {
//            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
//                ForEach(vm.imageURLs, id: \.self) {imageURL in
//                    NavigationLink(destination: {
//                        AsyncImageView(imageURL: imageURL, prompt: vm.curentPromt)
//                    }, label: {
//                        ZStack {
//                            AsyncImage(url: URL(string: imageURL)) { image in
//                                if let image = image.image {
//                                    image
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: UIScreen.main.bounds.width/3-12,  height: UIScreen.main.bounds.width/3-12)
//                                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                                                  )
//
//
//                                } else {
//                                    ProgressView()
//                                        .frame(height: UIScreen.main.bounds.width/3-12)
//                                }
//
//                            }
//                            VStack {
//                                HStack {
//                                    Image(systemName: "arrow.up.backward.and.arrow.down.forward")
//                                        .font(.footnote)
//                                        .foregroundStyle(.white)
//                                         .padding(6)
//                                        
//                                    Spacer()
//                                     Image(systemName: "heart.fill")
//                                         .font(.footnote)
//                                         .foregroundStyle(.red)
//                                         .padding(6)
//                                         .background(
//                                             Circle()
//                                                 .fill(.black.opacity(0.5))
//                                         )
//
//
//                                }
//                                Spacer()
//                            }
//                            .padding(10)
//                        }
//                        .background(
//                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                                .fill(.gray.opacity(0.2))
//                        )
//                    })
//
//                }
//            })
//        }
        ScrollView {
            AsyncImageGridView(arrayOfImages: vm.imageURLs)
        }
                .padding()
                .navigationTitle("Select Result")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            vm.isGenerating = true
                            vm.createButtonPushed()
                        }, label: {
                            CapsuleButton(imageSystemName: "arrow.triangle.2.circlepath", buttonTitle: "Recreate")
                                .frame(width: UIScreen.main.bounds.width - 32)
                        })
                    }
                }

    }
}

#Preview {
    NavigationStack {
        SelectResultView()
            .environmentObject(ViewModel())
    }
}
