//
//  LoginResponse.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/7/25.
//

import Foundation

struct LoginResponseBody: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: LoginResponseData
}

struct LoginResponseData: Codable {
    let userId: Int
}
