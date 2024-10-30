//
//  FinanceViewController.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

import SnapKit

class FinanceViewController: UIViewController {
    
    private let freeApps = App.freeApps
    private let paidApps = App.paidApps
    private let collectionViewApps = App.collectionViewApps
    private let essentialApps = App.essentialApps
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(HorizontalCollectionView.self, forCellReuseIdentifier: HorizontalCollectionView.cellIdentifier)
            $0.separatorColor = .clear
        }
        
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

extension FinanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HorizontalCollectionView.cellIdentifier,
            for: indexPath
        ) as? HorizontalCollectionView else {
            return UITableViewCell()
        }
        cell.configure(with: App.collectionViewApps)
        return cell
        
//        if indexPath.section == 0 {
//            // CollectionView가 포함된 셀
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: HorizontalCollectionView.cellIdentifier,
//                for: indexPath
//            ) as? HorizontalCollectionView else {
//                return UITableViewCell()
//            }
//            cell.configure(with: App.collectionViewApps)
//            return cell
//        } else {
//            // 나머지 3개의 가로 TableView가 포함된 셀
//            guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: HorizontalTableViewCell.cellIdentifier,
//                for: indexPath
//            ) as? HorizontalTableViewCell else {
//                return UITableViewCell()
//            }
//            let appData: [App]
//            switch indexPath.section {
//            case 1:
//                appData = App.freeApps
//            case 2:
//                appData = App.paidApps
//            case 3:
//                appData = App.essentialApps
//            default:
//                appData = []
//            }
//            cell.configure(with: appData)
//            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }

}

#Preview {
    FinanceViewController()
}
