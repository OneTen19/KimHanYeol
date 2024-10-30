//
//  HorizontalCollectionViewCell.swift
//  35-Seminar
//
//  Created by OneTen on 10/30/24.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    private let tableView = UITableView()
    private var apps: [App] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(AppTileView.self, forCellReuseIdentifier: AppTileView.cellIdentifier)
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = false
        }
    }
    
    private func setUI() {
        contentView.addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with app: [App]) {
        apps = app
    }
    
}

extension HorizontalCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppTileView.cellIdentifier, for: indexPath) as? AppTileView else {
            return UITableViewCell()
        }
        
        let app = apps[indexPath.row]
        cell.configure(with: app)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let app = apps[indexPath.row]
//        
//        if app.title == "토스" {
//            let nextViewController = TossViewController()
//            viewController.navigationController?.pushViewController(nextViewController, animated: true)
//        }
//        
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
}
