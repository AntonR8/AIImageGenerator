//
//  EnumStyle.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import Foundation

enum ImageStyle: String, CaseIterable, Codable {
    case art
    case photo
    case drawingStyle
    case none

    var title: String {
        switch self {
        case .art: "art"
        case .photo: "photo"
        case .drawingStyle: "drawing"
        case .none: "none"
        }
    }
}
