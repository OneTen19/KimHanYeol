//
//  HorizontalCollectionViewCell.swift
//  35-Seminar
//
//  Created by OneTen on 10/29/24.
//

import UIKit

import SnapKit

class HorizontalCollectionTableViewCell: UITableViewCell {
    
    private let collectionView = UICollectionView()

    private func setStyle() {
        collectionView.do {
            let flowLayout = UICollectionViewFlowLayout()
            
            $0.frame = .zero
            $0.collectionViewLayout = flowLayout
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
    
}

//extension HorizontalCollectionTableViewCell: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        4
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
