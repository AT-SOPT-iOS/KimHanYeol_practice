//
//  GetInfoService.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/3/25.
//

import UIKit

class GetInfoService {
    static let shared = GetInfoService()
    private init() {}

    func makeRequest(keyword: String?) -> URLRequest? {
        var urlString = "http://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    func makeMeRequest(userId: Int) -> URLRequest? {
        let urlString = "http://api.atsopt-seminar4.site/api/v1/users/me"

        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        let header2 = ["userId": "\(userId)"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        header2.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
    
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        guard let request = makeRequest(keyword: keyword) else {
            throw NetworkError.requestEncodingError
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.responseError
        }
        
        do {
            let decode = try JSONDecoder().decode(NicknameListResponseWrapper.self, from: data)
            return decode.data.nicknameList
        } catch {
            print("디코딩 실패")
            throw NetworkError.responseDecodingError
        }
    }
    
    func fetchMyNickname(userId: Int) async throws -> String {
        guard let request = makeMeRequest(userId: userId) else {
            throw NetworkError.requestEncodingError
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.responseError
        }
        
        do {
            let decode = try JSONDecoder().decode(MyNicknameListResponseWrapper.self, from: data)
            return decode.data.nickname
        } catch {
            print("디코딩 실패")
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
    
}
