//
//  ImageView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 26.09.2024.
//

import SwiftUI

struct HardCodeImageView: View {
    @EnvironmentObject var vm: ViewModel
    let image: HardCodeImageModel

    @State var showInfos = false
    @State var showSavedToGallery = false
    @State var showPromptCopied = false
    @State var showAddedToFavourites = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                imageRectangle
                promptTitle
                promptDescription
                infos
                titleForGrid
                HardCodeGridView(arrayOfImages: vm.hardCodeImages)
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    HardCodeImageView(image: HardCodeImageModel(imageName: "image2", prompt: "sdfsdfsf", style: .none))
        .environmentObject(ViewModel())
}


extension HardCodeImageView {
    var imageRectangle: some View {
        ZStack {
            Image(image.imageName)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            VStack {
                HStack {
                    Button(action: {
                        vm.saveHardCodeImageToGallery(inputImage: UIImage(imageLiteralResourceName: image.imageName))
                        withAnimation(.easeInOut) {
                            showSavedToGallery = true
                        }
                    }, label: {
                        SmallImageButton(systemName: "arrow.down.to.line", foregroundStyle: .white)
                    })

                    Spacer()

                    ShareLink(item: Image(image.imageName), preview: SharePreview("Image", image: Image(image.imageName))) {
                        SmallImageButton(systemName: "square.and.arrow.up", foregroundStyle: .white)
                    }

                    Button(action: {
                        vm.addToFavourites(image: image)
                        withAnimation(.easeInOut) {
                            showAddedToFavourites = true
                            let index = vm.returnHardCodeImageIndex(image: image)
                            vm.addOrDeleteHardCodeImageToFavourites(index: index)
                        }
                    }, label: {
                        SmallImageButton(
                            systemName: image.saved ? "heart.fill" : "heart",
                            foregroundStyle: image.saved ? .red : .white.opacity(0.5))
                    })
                }
                .padding(8)
                Spacer()
            }
            if showSavedToGallery {
                VStack {
                    CapsuleNotification(iconName: "checkmark.circle.fill", message: "Take a photo")
                        .offset(y: -14)
                    Spacer()
                }
                .onAppear(perform: {
                    withAnimation(.easeInOut) {
                        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {showSavedToGallery = false})
                    }
                })
            }
            if showPromptCopied {
                VStack {
                    CapsuleNotification(iconName: "checkmark.circle.fill", message: "Prompt copied")
                        .offset(y: -14)
                    Spacer()
                }
                .onAppear(perform: {
                    withAnimation(.easeInOut) {
                        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {showPromptCopied = false})
                    }
                })
            }
            if showAddedToFavourites {
                VStack {
                    CapsuleNotification(iconName: "checkmark.circle.fill", message: "Added to \"Profile\"")
                        .offset(y: -14)
                    Spacer()
                }
                .onAppear(perform: {
                    withAnimation(.easeInOut) {
                        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {showAddedToFavourites = false})
                    }
                })
            }
        }
        .padding(.bottom)
    }

    var promptTitle: some View {
        HStack {
            Text("Prompt")
                .font(.headline)
                .foregroundStyle(.primary)

            Spacer()
            Text("Copy")
                .foregroundStyle(.secondary)
            Button(action: {
                vm.copyPrompt(newPrompt: image.prompt)
                withAnimation(.easeInOut) {
                    showPromptCopied = true
                }
            }, label: {
                Image(systemName: "doc.on.doc")
            })
        }
        .padding(.vertical)
    }


    var promptDescription: some View {
        Text(image.prompt)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.tertiary.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 15))

    }

    var infos: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Infos")
                    .font(.headline)
                    .foregroundStyle(.primary)

                Spacer()
                Spacer()
                Text(showInfos ? "Collapse" : "Open")
                    .foregroundStyle(.secondary)
                Button(action: {
                    withAnimation(.bouncy) {
                        showInfos.toggle()
                    }
                }, label: {
                    Image(systemName: showInfos ? "chevron.down" : "chevron.up")
                })
            }
            if showInfos {
                Text("Details")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)
                scrollView
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 15.0).stroke(.tertiary, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        }
        .padding(.vertical)

    }


    var scrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                DetailsBanner(title: "Image size", description: image.imageSize)
                DetailsBanner(title: "Model", description: image.style.rawValue)
                DetailsBanner(title: "Aspect Ratio", description: image.aspectRation)
            }
        }
    }

    var titleForGrid: some View {
        Text("More images like this")
            .font(.title3)
            .bold()
            .foregroundStyle(.primary)
            .padding(.top)
    }

}

