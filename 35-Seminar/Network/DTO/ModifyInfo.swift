//
//  ModifyHobby.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import Foundation

struct ModifyInfoRequest: Codable {
  let hobby: String
  let password: String
}

struct ModifyInfoFailed: Codable {
    let code: String
}
