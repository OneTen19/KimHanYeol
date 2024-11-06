//
//  PreviewView.swift
//  35-Seminar
//
//  Created by OneTen on 10/16/24.
//

import UIKit
import SnapKit

class TossPreviewView: UIView {
    private var previewTitleLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var subDescriptionLabel = UILabel()
    private var extraButton = UIButton()
    private var previewImageCollectionView: UICollectionView
    private let flowLayout = UICollectionViewFlowLayout()
    private let itemSizeWidth = UIScreen.main.bounds.width / 2 + 40
    private let itemSizeHeight = 650
    
    private var images: [UIImage] = [.tosspreview01, .tosspreview02, .tosspreview03, .tosspreview04, .tosspreview05]
    
    override init(frame: CGRect) {
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: itemSizeWidth, height: 650)
        previewImageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        previewTitleLabel.do {
            $0.text = "미리보기"
            $0.font = .systemFont(ofSize: 24, weight: .semibold)
        }
        
        descriptionLabel.do {
            $0.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다."
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.numberOfLines = 2
        }
        
        subDescriptionLabel.do {
            $0.text = "- 내 금융 현황을 한눈에, 홈*소비"
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        extraButton.do {
            $0.setTitle("더 보기", for: .normal)
            $0.setTitleColor(.tintColor, for: .normal)
        }
        
        previewImageCollectionView.do {
            $0.register(TossPreviewImageCollectionViewCell.self, forCellWithReuseIdentifier: TossPreviewImageCollectionViewCell.cellIdentifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setUI() {
        self.addSubviews(previewTitleLabel, descriptionLabel, subDescriptionLabel, extraButton, previewImageCollectionView)
    }
    
    private func setLayout() {
        previewTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        previewImageCollectionView.snp.makeConstraints {
            $0.leading.equalTo(previewTitleLabel)
            $0.top.equalTo(previewTitleLabel.snp.bottom).offset(10)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(600)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(previewTitleLabel)
            $0.width.equalToSuperview()
            $0.top.equalTo(previewImageCollectionView.snp.bottom).offset(10)
        }
        
        subDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(descriptionLabel)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
        }
        
        extraButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(subDescriptionLabel)
        }
    }
    
}

extension TossPreviewView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TossPreviewImageCollectionViewCell.cellIdentifier, for: indexPath) as? TossPreviewImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let image = images[indexPath.row]
        cell.configure(with: image)
        
        return cell
    }
    
}
