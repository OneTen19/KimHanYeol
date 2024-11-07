//
//  LogIn.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import Foundation

struct LogInRequest: Encodable {
  let username: String
  let password: String
}

struct LoginResponse: Decodable {
    let result: Token
    
    struct Token: Decodable {
        let token : String
    }
}
