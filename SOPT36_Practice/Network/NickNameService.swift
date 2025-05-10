//
//  NickNameService.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/7/25.
//

import UIKit

class NickNameService {
    static let shared = NickNameService()
    private init() {}
    
    func makeRequestbody(nickName: String) -> Data? {
        do {
            let data = NickNameRequest(nickname: nickName)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?, userId: Int) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        let header = ["Content-Type": "application/json"]
        let header2 = ["userId": "\(userId)"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        header2.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func postNicknameData(nickName: String, userId: Int) async throws -> NickNameResponseBody {
        guard let body = makeRequestbody(nickName: nickName)
        else { throw NetworkError.requestEncodingError }
        
        let request = self.makeRequest(body: body, userId: userId)
        let (data, response) = try await URLSession.shared.data(for: request)
        dump(request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        dump(response)
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        do {
            let decode = try JSONDecoder().decode(NickNameResponseBody.self, from: data)
            return decode
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
    
}
