//
//  NickNameResponse.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/7/25.
//

import Foundation

struct NickNameResponseBody: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: String?
}

struct MyNicknameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: MyNicknameListResponseModel
}

struct MyNicknameListResponseModel: Codable {
    let nickname: String
}


struct NicknameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameListResponseModel
}

struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}
