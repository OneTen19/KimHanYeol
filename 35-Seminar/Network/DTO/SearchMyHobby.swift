//
//  SearchMyHobby.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import Foundation

struct SearchMyHobbyResponse: Codable {
    let result: SearchMyHobbyFailed?
    let hobby: String
}

struct SearchMyHobbyFailed: Codable {
    let code: String
}
