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

    private enum Field: Int {
        case prompttext
        case negativeprompttext
    }

    @FocusState private var focusedField: Field?

    let promptTip = PromptTip()

    var body: some View {
        ZStack {
            backGround
            ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Enter Prompt")
                    .font(.headline)

                AITextEditor(bindingTextFieldVar: $vm.curentPromt, promptPlaceholder: "What do you want to generate?")
                    .focused($focusedField, equals: .prompttext)
                    .popoverTip(promptTip, arrowEdge: .top)
                    .onTapGesture {
                        promptTip.invalidate(reason: .actionPerformed)
                    }
                    .tipViewStyle(CustomTipViewStyle())

                Text("Style")
                    .font(.headline)
                    .padding(.top)

                ChooseStyleHStackView()

                NegativeWordsMenuView(shownegativeTextField: $shownegativeTextField)

                if shownegativeTextField {
                    AITextEditor(bindingTextFieldVar: $vm.curentNegativePromt, promptPlaceholder: "Use negative words like “blue” to get less blue color")
                        .focused($focusedField, equals: .negativeprompttext)
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
        .scrollDismissesKeyboard(.immediately)
        .onTapGesture {
            if (focusedField != nil) {
                focusedField = nil
            }
        }
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
