//
//  FinanceViewController.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

import SnapKit

class FinanceViewController: UIViewController {
    
    private let apps = App.freeApps

    private let tableView = UITableView()
    private let imageCollectionView = UICollectionView()
    private let sectionTableView = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
//        tableView.do {
//            $0.dataSource = self
//            $0.delegate = self
//        }
        
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
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    
//    
//}

//#Preview {
//    FinanceViewController()
//}
