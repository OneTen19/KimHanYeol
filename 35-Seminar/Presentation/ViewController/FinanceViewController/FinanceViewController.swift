//
//  FinanceViewController.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

import SnapKit

class FinanceViewController: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        
        self.navigationItem.title = "금융"
    }
    
    private func setStyle() {
        
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(HorizontalCollectionWithBackgroundImageView.self, forCellReuseIdentifier: HorizontalCollectionWithBackgroundImageView.cellIdentifier)
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HorizontalCollectionWithBackgroundImageView.cellIdentifier, for: indexPath) as? HorizontalCollectionWithBackgroundImageView else { return UITableViewCell() }
            
            cell.configure(with: App.collectionViewApps)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HorizontalCollectionView.cellIdentifier, for: indexPath) as? HorizontalCollectionView else { return UITableViewCell() }
            
            switch indexPath.section {
            case 1:
                cell.configure(with: App.essentialApps, index: indexPath.section)
            case 2:
                cell.configure(with: App.paidApps, index: indexPath.section)
            case 3:
                cell.configure(with: App.freeApps, index: indexPath.section)
            default:
                return cell
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }

}

