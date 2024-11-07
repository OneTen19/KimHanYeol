//
//  SearchViewController.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit
import SnapKit
import Then

class ServerViewController: UIViewController {
    var myHobby: String = "Test Hobby"
    var searchUserId: String = ""
    var searchUserHobby: String = "Test Hobby"
    
    private var baseView = UIView()
    private let userImageView = UIImageView()
    private let myHobbyLabel = UILabel()
    private let modifyButton = UIButton()
    private let searchDescriptionLabel = UILabel()
    private let searchUserTextField = UITextField()
    private let searchUserHobbyTextLabel = UILabel()
    private let searchButton = UIButton()
    private let logOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        userImageView.do {
            $0.image = UIImage(systemName: "person.circle")
            $0.tintColor = .orange
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
        }

        myHobbyLabel.do {
            $0.text = myHobby
            $0.font = .systemFont(ofSize: 28, weight: .semibold)
        }
        
        modifyButton.do {
            $0.setTitle("내 취미 변경", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .orange
            $0.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        searchDescriptionLabel.do {
            $0.text = "다른 유저들 취미 구경하기"
            $0.textColor = .gray
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        searchUserTextField.do {
            $0.placeholder = "유저 ID 입력"
            $0.font = .systemFont(ofSize: 24)
            $0.borderStyle = .bezel
            $0.configureDefaultSettings()
            $0.addLeftPadding()
        }
        
        searchUserHobbyTextLabel.do {
            $0.text = searchUserHobby
            $0.font = .systemFont(ofSize: 28, weight: .semibold)
        }
        
        searchButton.do {
            $0.setTitle("유저 정보 검색하기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .gray
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        }
        
        logOutButton.do {
            $0.setTitle("Log Out", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 28)
            $0.backgroundColor = .tintColor
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        }
        
    }
    
    func setUI() {
        self.view.addSubviews(baseView)
        baseView.addSubviews(userImageView, myHobbyLabel, modifyButton, searchUserTextField, searchDescriptionLabel, searchUserHobbyTextLabel, searchButton, logOutButton)
    }
    
    func setLayout() {
        baseView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(200)
        }
        
        myHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        modifyButton.snp.makeConstraints {
            $0.top.equalTo(myHobbyLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        searchUserTextField.snp.makeConstraints {
            $0.top.equalTo(modifyButton.snp.bottom).offset(70)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        searchDescriptionLabel.snp.makeConstraints {
            $0.bottom.equalTo(searchUserTextField.snp.top).offset(-10)
            $0.leading.equalTo(searchUserTextField)
        }
        
        searchUserHobbyTextLabel.snp.makeConstraints {
            $0.top.equalTo(searchUserTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(searchUserTextField.snp.bottom).offset(70)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        logOutButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        
    }
    
    @objc private func modifyButtonTapped() {
        
    }
    
    @objc private func searchButtonTapped() {
        
    }
    
    @objc private func logOutButtonTapped() {
        self.dismiss(animated: false)
    }

}
