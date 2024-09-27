//
//  AIArtView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI
import TipKit

struct AIArtView: View {
    @EnvironmentObject var vm: ViewModel
    @State var shownegativeTextField = false

    let promptTip = PromptTip()

    var body: some View {
        ZStack {
            backGround
            ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Enter Prompt")
                    .font(.headline)

                AITextEditor(bindingTextFieldVar: $vm.curentPromt)
                    .popoverTip(promptTip, arrowEdge: .top)

                Text("Style")
                    .font(.headline)
                    .padding(.top)

                ChooseStyleHStackView()

                NegativeWordsMenuView(shownegativeTextField: $shownegativeTextField)

                if shownegativeTextField {
                    AITextEditor(bindingTextFieldVar: $vm.curentNegativePromt)
                }

                Button(action: {
                    vm.isGenerating = true
                    vm.createButtonPushed()
                }, label: {
                    CapsuleButton(imageSystemName: "sparkles", buttonTitle: "Create")
                })
                .padding(.vertical)

                InspirationsRecentsMenuView()

                if vm.inspirationChosen {
                    HardCodeGridView(arrayOfImages: vm.hardCodeImages)
                } else {
                    AsyncImageGridView(arrayOfImages: vm.recents)
                }
            }
        }
            .padding()
        }
        .fullScreenCover(isPresented: $vm.isGenerating, content: {
            GeneratingVIew()
        })
    }
}


    #Preview {
        NavigationStack {
            AIArtView()
                .environmentObject(ViewModel())
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
}


extension AIArtView {
    var backGround: some View {
        VStack {
            Image("backGround")
                .resizable()
                .scaledToFit()
            Spacer()
        }
        .ignoresSafeArea()
    }
}
