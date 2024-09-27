//
//  HardCodeImageModel.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 25.09.2024.
//

import SwiftUI

struct HardCodeImageModel: Identifiable, Codable {
    let id: String
    let imageName: String
    let prompt: String
    let imageSize: String
    let aspectRation: String
    let style: ImageStyle
    var saved: Bool

    init(imageName: String, prompt: String, style: ImageStyle, saved: Bool = false) {
        self.id = imageName
        self.imageName = imageName
        self.prompt = prompt
        self.style = style
        self.imageSize = "1024x1024"
        self.aspectRation = "1:1 - landscape"
        self.saved = saved
    }

    func addOrDeleteHardCodeImageToFavourites() -> HardCodeImageModel {
        return HardCodeImageModel(imageName: imageName, prompt: prompt, style: style, saved: !saved)
    }
}
