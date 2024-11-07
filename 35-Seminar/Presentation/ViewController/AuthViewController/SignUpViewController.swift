//
//  SignUpViewController.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    private let userService = UserService()
    
    private var userId = UITextField()
    private var userPassword = UITextField()
    private var myHobby = UITextField()
    private var resultLabel = UILabel()
    private lazy var signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setUI()
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        userId.do {
            $0.placeholder = "ID"
            $0.font = .systemFont(ofSize: 32)
            $0.borderStyle = .bezel
            $0.configureDefaultSettings()
            $0.addLeftPadding()
        }
        
        userPassword.do {
            $0.placeholder = "Password"
            $0.font = .systemFont(ofSize: 32)
            $0.borderStyle = .bezel
            $0.configureDefaultSettings()
            $0.addLeftPadding()
        }
        
        myHobby.do {
            $0.placeholder = "내 취미는?"
            $0.font = .systemFont(ofSize: 32)
            $0.borderStyle = .bezel
            $0.configureDefaultSettings()
            $0.addLeftPadding()
        }
        
        resultLabel.do {
            $0.textColor = .red
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        signUpButton.do {
            $0.setTitle("Sign Up", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .tintColor
            $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        }
        
    }
    
    func setUI() {
        self.view.addSubviews(userId, userPassword, myHobby, resultLabel, signUpButton)
    }
    
    func setLayout() {
        userId.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        userPassword.snp.makeConstraints {
            $0.leading.equalTo(userId)
            $0.top.equalTo(userId.snp.bottom).offset(10)
            $0.width.equalTo(300)
        }
        
        myHobby.snp.makeConstraints {
            $0.leading.equalTo(userPassword)
            $0.top.equalTo(userPassword.snp.bottom).offset(10)
            $0.width.equalTo(300)
        }
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(myHobby.snp.bottom).offset(20)
        }
        
        signUpButton.snp.makeConstraints {
            $0.leading.equalTo(myHobby)
            $0.top.equalTo(myHobby.snp.bottom).offset(50)
            $0.width.equalTo(300)
        }
        
    }
    
    
    @objc func signUpButtonTapped() {
        guard let username = userId.text,
              let password = userPassword.text,
              let hobby = myHobby.text else { return }
        
        userService.signUp(
            username: username,
            password: password,
            hobby: hobby
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case .success:
                    text = "회원 등록 성공했어요."
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }
    
    
}
