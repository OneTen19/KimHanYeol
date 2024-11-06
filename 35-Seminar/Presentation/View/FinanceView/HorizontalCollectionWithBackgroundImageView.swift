//
//  HorizontalCollectionView.swift
//  35-Seminar
//
//  Created by OneTen on 10/29/24.
//

import UIKit

import SnapKit

class HorizontalCollectionWithBackgroundImageView: UITableViewCell {
    
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
            $0.register(HorizontalCollectionWithBackgroundImageCell.self, forCellWithReuseIdentifier: HorizontalCollectionWithBackgroundImageCell.cellIdentifier)
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

extension HorizontalCollectionWithBackgroundImageView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionWithBackgroundImageCell.cellIdentifier, for: indexPath) as? HorizontalCollectionWithBackgroundImageCell else {
            return UICollectionViewCell()
        }
        
        let app = apps[indexPath.row]
        cell.configure(with: app)
        return cell
    }
    
}


