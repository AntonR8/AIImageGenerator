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
    }
    
    var message: Text? {
        Text("And our AI will create a unique image for you")
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
