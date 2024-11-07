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
        }
        
        userPassword.do {
            $0.placeholder = "Password"
            $0.font = .systemFont(ofSize: 32)
            $0.borderStyle = .bezel
        }
        
        loginButton.do {
            $0.setTitle("Log In", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .tintColor
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
        
        signUpButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .gray
            $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        }
        
    }
    
    func setUI() {
        self.view.addSubviews(loginImageView, userId, userPassword, loginButton, signUpButton)
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
        
        loginButton.snp.makeConstraints {
            $0.leading.equalTo(userPassword)
            $0.top.equalTo(userPassword.snp.bottom).offset(20)
            $0.width.equalTo(300)
        }
        
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
    }
    
    @objc func loginButtonTapped() {
        
    }
    
    @objc private func signUpButtonTapped() {
        let nextViewController = SignUpViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
