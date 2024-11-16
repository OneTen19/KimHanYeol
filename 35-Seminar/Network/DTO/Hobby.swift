//
//  SearchHobby.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import Foundation

struct Hobbyrequest: Decodable {
    let result: Hobby
    
    struct Hobby: Decodable {
        let hobby: String
    }
}
