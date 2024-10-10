//
//  DownloadManager.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 19.09.2024.
//

import SwiftUI

class DownloadManager {
    let profileId: Int = 7
    @AppStorage("userId") var userId: Int = Int.random(in: 0...Int.max)

    
    func createPOSTrequest(prompt: String, selectedStyle: ImageStyle) -> String {
        let formattedPrompt = "\(selectedStyle.title) image of \(prompt)"
        return "https://codewizardev.space/api/v2/generate?profileId=\(profileId)&userId=\(userId)&prompt=\(formattedPrompt)&lang=en"
        // "https://codewizardev.space/api/v2/generate?profileId=7&userId=11232323&prompt=dog with cats face&lang=en"
    }


    func createFETCHrequest(receivedRequestID: String)  -> String {
        return "https://codewizardev.space/api/v2/result?requestId=\(receivedRequestID)"
    }

    func returnResponse(postRequestString: String, httpMethod: String) async throws -> ResponseModel {
        guard let url = URL(string: postRequestString) else { throw FetcherError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        let (receivedData, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(ResponseModel.self, from: receivedData)
        return response
    }

    func getRequestID(prompt: String, selectedStyle: ImageStyle) async throws -> String {
        let postRequestString = createPOSTrequest(prompt: prompt, selectedStyle: selectedStyle)
        let response = try await returnResponse(postRequestString: postRequestString, httpMethod: "POST")
        print(response.data.requestID)
        return response.data.requestID
    }

    func getImageURLs(response: ResponseModel) -> [String] {
        print(response.self)
        var urls: [String] = []
        for i in (0..<response.data.result.count) {
            let url = response.data.result[i].url
            urls.append(url)
        }
        print(urls)
        return urls
    }

    func checkResultIsEmpty(response: ResponseModel) -> Bool {
        response.data.result.isEmpty
    }

    func returnNotEmptyResponse(receivedRequestID: String) async throws -> ResponseModel {
        var isEmpty = true
        var count = 0
        var response = ResponseModel(error: false, data: DataClass(requestID: "", status: "processing", error: "", request: Request(profileID: 0, app: nil, version: nil, gender: nil, bodyPart: nil, userPrompt: "", productionPrompt: "", ai: ""), result: []))
        repeat {
            let postRequestString = createFETCHrequest(receivedRequestID: receivedRequestID)
            response = try await returnResponse(postRequestString: postRequestString, httpMethod: "GET")
            isEmpty = checkResultIsEmpty(response: response)
            count += 1
            print(count.description)
            sleep(1)
        } while isEmpty
        sleep(3)
        return response
    }




    
}
