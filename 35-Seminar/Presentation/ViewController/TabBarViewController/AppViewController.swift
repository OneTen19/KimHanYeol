//
//  AppViewController.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

import SnapKit
import Then

class AppViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private var baseView = UIView()
    private lazy var moveToFinanceButton = UIButton()
    
    // UI 요소의 스타일을 설정
    func setStyle() {
        moveToFinanceButton.do {
            $0.setTitle("금융", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 64, weight: .semibold)
            $0.backgroundColor = .tintColor
            $0.layer.cornerRadius = 20
        }
        moveToFinanceButton.addTarget(self, action: #selector(moveToFinanceButtonTapped), for: .touchUpInside)
    }
    
    // UI 구성 요소를 추가
    func setUI() {
        self.view.addSubview(baseView)
        baseView.addSubview(moveToFinanceButton)
    }
    
    // UI 요소들의 레이아웃을 설정
    func setLayout() {
        baseView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        moveToFinanceButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc private func moveToFinanceButtonTapped() {
        let nextViewController = FinanceViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

#Preview {
    AppViewController()
}
