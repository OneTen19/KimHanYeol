//
//  LogIn.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import Foundation

struct LogInRequest: Codable {
  let username: String
  let password: String
}

struct LogInSuccess: Codable {
    let result: LogInFailed?
    let token: Int
}

struct LogInFailed: Codable {
    let code: String
}
