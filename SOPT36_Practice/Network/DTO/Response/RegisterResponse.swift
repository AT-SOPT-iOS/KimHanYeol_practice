//
//  RegisterResponse.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/3/25.
//

import UIKit

struct RegisterResponseBody: Codable {
    let userId: Int
    let nickname: String
}

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseBody
}

