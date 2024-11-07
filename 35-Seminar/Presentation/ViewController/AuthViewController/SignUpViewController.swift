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
        }
        
        userPassword.do {
            $0.placeholder = "Password"
            $0.font = .systemFont(ofSize: 32)
            $0.borderStyle = .bezel
        }
        
        signUpButton.do {
            $0.setTitle("Sign Up", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .tintColor
            $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        }
        
    }
    
    func setUI() {
        self.view.addSubviews(userId, userPassword, signUpButton)
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
        
        signUpButton.snp.makeConstraints {
            $0.leading.equalTo(userPassword)
            $0.top.equalTo(userPassword.snp.bottom).offset(20)
            $0.width.equalTo(300)
        }
        
    }
    

    @objc func signUpButtonTapped() {
        
    }
    
    
}
