//
//  LoginRequest.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/7/25.
//

import Foundation

struct LoginRequestBody: Codable {
    let loginId: String
    let password: String
}
