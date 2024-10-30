//
//  HorizontalCollectionView.swift
//  35-Seminar
//
//  Created by OneTen on 10/29/24.
//

import UIKit

import SnapKit

class HorizontalCollectionView: UITableViewCell {
    
    private let collectionView: UICollectionView
    private let flowLayout = UICollectionViewFlowLayout()
    private let itemSizeWidth = UIScreen.main.bounds.width
    private let itemSizeHeight = UIScreen.main.bounds.height / 2
    
    private var apps: [App] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: itemSizeWidth, height: itemSizeHeight)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
               
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        collectionView.do {
            $0.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.cellIdentifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setUI() {
        contentView.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with app: [App]) {
        apps = app
    }
    
}

extension HorizontalCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.cellIdentifier, for: indexPath) as? HorizontalCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let app = apps[indexPath.row]
        cell.configure(with: app)
        return cell
    }
    
}


