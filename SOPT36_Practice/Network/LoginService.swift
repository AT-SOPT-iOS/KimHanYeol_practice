//
//  LoginService.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/7/25.
//

import UIKit

class LoginService {
    static let shared = LoginService()
    private init() {}
    
    func makeRequestbody(loginId: String, password: String) -> Data? {
        do {
            let data = LoginRequestBody(loginId: loginId, password: password)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/auth/signin")!
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
    
    func postLoginData(loginId: String, password: String) async throws -> LoginResponseData {
        guard let body = makeRequestbody(loginId: loginId, password: password)
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
            let decode = try JSONDecoder().decode(LoginResponseBody.self, from: data)
            return decode.data
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
    
}
