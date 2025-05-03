//
//  RegisterRequest.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/3/25.
//

import UIKit

struct RegisterRequestBody: Codable {
    let loginId: String
    let password: String
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
