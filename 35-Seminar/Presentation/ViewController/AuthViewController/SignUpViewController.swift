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
    
    private let SignUpMessage = UILabel()
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
        SignUpMessage.do {
            $0.text = "Sign Up"
            $0.font = .systemFont(ofSize: 48)
        }
        
        userId.do {
            $0.placeholder = "ID"
            $0.font = .systemFont(ofSize: 32)
            $0.borderStyle = .bezel
            $0.configureDefaultSettings()
            $0.addLeftPadding()
            $0.delegate = self
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
            $0.delegate = self
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
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
    }
    
    func setUI() {
        self.view.addSubviews(SignUpMessage, userId, userPassword, myHobby, resultLabel, signUpButton)
    }
    
    func setLayout() {
        SignUpMessage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-200)
        }
        
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
                    self.dismiss(animated: true)
                    text = "회원 등록 성공했어요."
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }
        
}

extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 백스페이스 처리
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        guard textField.text!.count < 8 else { return false } // 8글자로 제한
        return true
    }
}
