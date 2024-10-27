//
//  ArcadeViewController.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit
import SnapKit
import Then

class ArcadeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private var baseView = UIView()
    
    private var label = UILabel().then {
        $0.text = "Arcade 화면"
        $0.font = .systemFont(ofSize: 64, weight: .semibold)
    }
    
    func setUI() {
        self.view.addSubview(baseView)
        self.view.addSubview(label)
        
        baseView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

    }

    
}
