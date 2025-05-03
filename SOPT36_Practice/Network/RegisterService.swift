//
//  RegisterService.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/3/25.
//

import UIKit

class RegisterService {
    static let shared = RegisterService()
    private init() {}
    
    func makeRequestbody(loginId: String, password: String, nickname: String) -> Data? {
        do {
            let data = RegisterRequestBody(loginId: loginId, password: password, nickname: nickname)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/auth/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func postRegisterData(loginId: String, password: String, nickname: String) async throws -> RegisterResponseBody {
        guard let body = makeRequestbody(loginId: loginId, password: password, nickname: nickname)
        else { throw NetworkError.requestEncodingError }
        
        let request = self.makeRequest(body: body)
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
            let decode = try JSONDecoder().decode(RegisterResponseWrapper.self, from: data)
            return decode.data
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
    
}
