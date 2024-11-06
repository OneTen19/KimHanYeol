//
//  SecondReviewView.swift
//  35-Seminar
//
//  Created by OneTen on 10/16/24.
//

import UIKit
import SnapKit

class TossReviewListCollectionView: UIView {
    
    private var evaluatelabel = UILabel()
    private var evaluateStarStackView = UIStackView()
    private var reviewSectionCollectionView: UICollectionView
    private let flowLayout = UICollectionViewFlowLayout()
    private var writeReviewSection = UIView()
    private let writeReviewButton = UIButton()
    private let supportAppButton = UIButton()
    private let reviews = TossReview.TossReviewMockData
    
    override init(frame: CGRect) {
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: 340, height: 300)
        reviewSectionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        evaluatelabel.do {
            $0.text = "탭하여 평가하기:"
            $0.font = .systemFont(ofSize: 18, weight: .semibold)
            $0.textColor = .gray
        }
        
        reviewSectionCollectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(TossReviewListCollectionViewcell.self, forCellWithReuseIdentifier: TossReviewListCollectionViewcell.cellIdentifier)
            $0.layer.cornerRadius = 20
            $0.backgroundColor = .gray.withAlphaComponent(0.2)
            $0.showsHorizontalScrollIndicator = false
        }
        
        evaluateStarStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            
            for _ in 0..<5 {
                let starImageView = UIImageView() // 새로운 UIImageView 인스턴스 생성
                starImageView.image = UIImage(systemName: "star")
                starImageView.contentMode = .scaleAspectFit
                starImageView.tintColor = .tintColor
                starImageView.snp.makeConstraints { $0.size.equalTo(32) }
                $0.addArrangedSubview(starImageView)
            }
        }
        
        writeReviewButton.do {
            $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
            $0.setTitle(" 리뷰 작성", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            $0.setTitleColor(.tintColor, for: .normal)
        }
        
        supportAppButton.do {
            $0.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
            $0.setTitle(" 앱 지원", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            $0.setTitleColor(.tintColor, for: .normal)
        }
        
    }
    
    private func setUI() {
        self.addSubviews(evaluatelabel, evaluateStarStackView, reviewSectionCollectionView, writeReviewSection, writeReviewButton, supportAppButton)
    }
    
    private func setLayout() {
        evaluatelabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        evaluateStarStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(evaluatelabel)
        }
        
        reviewSectionCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(evaluatelabel.snp.bottom).offset(20)
            $0.height.equalTo(280)
        }
        
        writeReviewSection.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(reviewSectionCollectionView.snp.bottom)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        writeReviewButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        supportAppButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
}

extension TossReviewListCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TossReviewListCollectionViewcell.cellIdentifier, for: indexPath) as? TossReviewListCollectionViewcell else {
            return UICollectionViewCell()
        }
        
        let review = reviews[indexPath.row]
        cell.configure(with: review)
        
        return cell
    }
    
}
