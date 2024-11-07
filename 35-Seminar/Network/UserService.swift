//
//  UserService.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import UIKit
import Alamofire

class UserService {
    
    // 회원가입
    func signUp(username: String, password: String, hobby: String, completion: @escaping (Result<Bool, NetworkError>) -> Void){
        
        // baseURL + /user = http://211.188.53.75:8080/user
        let url = Environment.baseURL + "/user"
        
        let parameters = SignUpRequest(username: username, password: password, hobby: hobby)
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate()
            .response { [weak self] response in
                
                guard let statusCode = response.response?.statusCode,
                      let data = response.data,
                      let self
                else {
                    completion(.failure(.unknownError))
                    return
                }
                
                
                switch response.result {
                case .success:
                    completion(.success(true))
                case .failure:
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
            }
    }
    
    // 로그인
    func logIn(username: String, password: String, completion: @escaping (Result<Bool, NetworkError>) -> Void){
        
        // baseURL + /login = http://211.188.53.75:8080/login
        let url = Environment.baseURL + "/login"
        
        let parameters = LogInRequest(username: username, password: password)
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate()
            .response { [weak self] response in
                
                guard let statusCode = response.response?.statusCode,
                      let data = response.data,
                      let self
                else {
                    completion(.failure(.unknownError))
                    return
                }
                
                
                switch response.result {
                case .success:
                    let token = self.decodeToken(data: data)
                    completion(.success(true))
                    // token ud에 저장
                    UserDefaults.standard.set(token, forKey: "token")
                    UserDefaults.standard.set(username, forKey: "username")
                case .failure:
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
                
            }
        
    }
    
    // 내 취미 검색
    func myHobby(completion: @escaping (Result<String, NetworkError>) -> Void){
        let url = Environment.baseURL + "/user/my-hobby"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        AF.request(url, method: .get, headers: ["token": "\(token)"])
            .validate()
            .response { [weak self] response in
                guard let statusCode = response.response?.statusCode,
                      let data = response.data,
                      let self
                else {
                    completion(.failure(.unknownError))
                    return
                }
                
                switch response.result {
                case .success:
                    let hobby = self.decodeHobby(data: data)
                    UserDefaults.standard.set(hobby, forKey: "hobby")
                    completion(.success(hobby))
                case .failure:
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
            }
        
    }
    
    // 다른 사람 취미 검색
    func searchHobby(num: Int, completion: @escaping (Result<String, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/user/\(num)/hobby"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        AF.request(url, method: .get, headers: ["token": "\(token)"])
            .validate()
            .response { [weak self] response in
                guard let statusCode = response.response?.statusCode,
                      let data = response.data,
                      let self
                else {
                    completion(.failure(.unknownError))
                    return
                }
                
                switch response.result {
                case .success:
                    let hobby = self.decodeHobby(data: data)
                    UserDefaults.standard.set(hobby, forKey: "hobby")
                    completion(.success(hobby))
                case .failure:
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
            }
    }
    
    // 내 정보 수정
    func modifyInfo(hobby: String, password: String, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/user"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let parameters = ModifyInfoRequest(hobby: hobby, password: password)
        
        AF.request(url, method: .put, parameters: parameters, encoder: JSONParameterEncoder.default, headers: ["token": "\(token)"])
            .validate()
            .response { [weak self] response in
                guard let statusCode = response.response?.statusCode,
                      let data = response.data,
                      let self
                else {
                    completion(.failure(.unknownError))
                    return
                }
                
                switch response.result {
                case .success:
                    UserDefaults.standard.set(hobby, forKey: "hobby")
                    completion(.success(true))
                case .failure:
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
            }
    }
    
    func handleStatusCode(_ statusCode: Int, data: Data) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
    
    func decodeToken(data: Data) -> String {
        guard let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
        else {
            return "error"
        }
        return response.result.token
    }
    
    func decodeHobby(data: Data) -> String {
        guard let response = try? JSONDecoder().decode(Hobbyrequest.self, from: data)
        else {
            return "error"
        }
        return response.result.hobby
    }
    
}
