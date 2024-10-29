//
//  FinanceViewController.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

import SnapKit

class FinanceViewController: UIViewController {
    
//    private let apps = 
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
    }
    
    private func setUI() {
        view.addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}

//extension FinanceViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        4
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//
//    
//}

