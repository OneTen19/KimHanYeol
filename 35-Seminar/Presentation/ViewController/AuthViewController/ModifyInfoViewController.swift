//
//  ModifyInfoViewController.swift
//  35-Seminar
//
//  Created by OneTen on 11/8/24.
//

import UIKit

class ModifyInfoViewController: UIViewController {
    private let userService = UserService()
    
    private let baseView = UIView()
    private let titleLabel = UILabel()
    private let hobbyTextField = UITextField()
    private let passwordTextFied = UITextField()
    private let errorMessageLabel = UILabel()
    private let modifyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setUI()
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        titleLabel.do {
            $0.text = "Modify Hobby"
            $0.font = .systemFont(ofSize: 48, weight: .semibold)
        }
        
        hobbyTextField.do {
            $0.placeholder = "취미를 입력하세요"
            $0.font = .systemFont(ofSize: 36)
            $0.borderStyle = .bezel
            $0.configureDefaultSettings()
            $0.addLeftPadding()
            $0.delegate = self
        }
        
        passwordTextFied.do {
            $0.placeholder = "비밀번호 입력"
            $0.font = .systemFont(ofSize: 36)
            $0.borderStyle = .bezel
            $0.configureDefaultSettings()
            $0.addLeftPadding()
            $0.delegate = self
        }
        
        errorMessageLabel.do {
            $0.textColor = .red
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        modifyButton.do {
            $0.setTitle("변경 완료", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .tintColor
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
        }
        
        
    }
    
    func setUI() {
        self.view.addSubview(baseView)
        baseView.addSubviews(titleLabel, hobbyTextField, passwordTextFied, errorMessageLabel, modifyButton)
    }
    
    func setLayout() {
        baseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        passwordTextFied.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        errorMessageLabel.snp.makeConstraints {
            $0.bottom.equalTo(modifyButton.snp.top).offset(-10)
            $0.centerX.equalToSuperview()
        }
        
        modifyButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
    }
    
    @objc private func modifyButtonTapped() {
        guard let hobby = hobbyTextField.text,
              let password = passwordTextFied.text else { return }
        
        DispatchQueue.main.async {
            self.userService.modifyInfo(
                hobby: hobby,
                password: password
            ) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.dismiss(animated: true)
                case let .failure(error):
                    errorMessageLabel.text = error.errorMessage
                    self.dismiss(animated: true) // 에러나면 화면이 멈춰서 그냥 뒤로가기 해놓음
                }
            }
        }
    }
    
}

extension ModifyInfoViewController: UITextFieldDelegate {
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
