//
//  ImageDataService.swift
//  AIImageGenerator
//
//  Created by АнтохаПрограммист on 12.09.2024.
//

import Foundation

struct ResponseModel: Codable {
    let error: Bool
    let data: DataClass
}


struct DataClass: Codable {
    let requestID, status: String
    let error: String?
    let request: Request
    let result: [Result]

    enum CodingKeys: String, CodingKey {
        case requestID = "requestId"
        case status, error, request, result
    }
}


struct Request: Codable {
    let profileID: Int
    let app, version, gender, bodyPart: Int?
    let userPrompt, productionPrompt: String
    let ai: String

    enum CodingKeys: String, CodingKey {
        case profileID = "profileId"
        case app, version, gender, bodyPart, userPrompt, productionPrompt, ai
    }
}

struct Result: Codable, Identifiable {
    let id: String
    let url: String
}


//struct Request: Codable {
//    let profileID: Int
//    let app, version, color, style: JSONNull?
//    let userPrompt, productionPrompt: String
//    let gender, bodyPart: JSONNull?
//    let ai: String
//
//    enum CodingKeys: String, CodingKey {
//        case profileID = "profileId"
//        case app, version, color, style, userPrompt, productionPrompt, gender, bodyPart, ai
//    }
//}
