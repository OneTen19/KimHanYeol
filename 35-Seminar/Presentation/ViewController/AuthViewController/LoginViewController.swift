//
//  LoginViewController.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private let userService = UserService()
    
    private var loginImageView = UIImageView()
    private var userId = UITextField()
    private var userPassword = UITextField()
    private var resultLabel = UILabel()
    private lazy var loginButton = UIButton()
    private lazy var signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setUI()
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        loginImageView.do {
            $0.image = UIImage(systemName: "apple.logo")
            $0.tintColor = .black
            $0.contentMode = .scaleAspectFit
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
            $0.delegate = self
        }
        
        resultLabel.do {
            $0.textColor = .red
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        loginButton.do {
            $0.setTitle("Log In", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .tintColor
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        signUpButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .gray
            $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
    }
    
    func setUI() {
        self.view.addSubviews(loginImageView, userId, userPassword, resultLabel, loginButton, signUpButton)
    }
    
    func setLayout() {
        loginImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-200)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(150)
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
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userPassword.snp.bottom).offset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.equalTo(userPassword)
            $0.top.equalTo(userPassword.snp.bottom).offset(50)
            $0.width.equalTo(300)
        }
        
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
    }
    
    @objc func loginButtonTapped() {
        guard let username = userId.text,
              let password = userPassword.text else { return }
        
        userService.logIn(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text = ""
                switch result {
                case .success:
                    self.present(MainTabBarController(), animated: false)
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
        
    }
    
    @objc private func signUpButtonTapped() {
        let nextViewController = SignUpViewController()
        self.present(nextViewController, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
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
