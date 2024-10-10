//
//  Tips.swift
//  AIImageGenerator
//
//  Created by АнтохаПрограммист on 14.09.2024.
//

import Foundation
import TipKit


struct PromptTip: Tip {
    var title: Text {
        Text("Write what you want")
            .foregroundStyle(.white)
    }
    
    var message: Text? {
        Text("And our AI will create a unique image for you")
            .foregroundStyle(.white)
    }
    
    var image: Image? {
        Image(systemName: "sparkles")
    }

    var options: [TipOption] {
            [Tip.MaxDisplayCount(1)]
        }
}


struct SaveTip: Tip {
    var title: Text {
        Text("Tap to save")
    }

    var message: Text? {
        Text("The image will be saved in your favorites")
    }

    var image: Image? {
        Image(systemName: "hand.tap")
    }

    var options: [TipOption] {
            [Tip.MaxDisplayCount(1)]
        }
}

struct CustomTipViewStyle: TipViewStyle {
    func makeBody(configuration: TipViewStyle.Configuration) -> some View {
        VStack {
            HStack(alignment: .top) {
                configuration.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40.0, height: 40.0)
                    .foregroundStyle(.white)


                VStack(alignment: .leading, spacing: 8.0) {
                    configuration.title?
                        .font(.headline)
                    configuration.message?
                        .font(.subheadline)

                    ForEach(configuration.actions) { action in
                        Button(action: action.handler) {
                            action.label().foregroundStyle(.blue)
                        }
                    }
                }

                Button(action: { configuration.tip.invalidate(reason: .tipClosed) }) {
                    Image(systemName: "xmark").scaledToFit()
                        .foregroundStyle(.white)
                }
            }
        }
        .padding()
        .background(.accent)
    }
}
