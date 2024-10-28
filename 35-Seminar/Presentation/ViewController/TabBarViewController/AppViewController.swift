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
        setUI()
    }

    private var tableView = UITableView(frame: .zero, style: .grouped)

    
    func setUI() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        


    }

    
}

#Preview {
    AppViewController()
}
