//
//  TossReviewListCollectionViewcell.swift
//  35-Seminar
//
//  Created by OneTen on 10/31/24.
//

import UIKit

class TossReviewListCollectionViewcell: UICollectionViewCell {
    
    private let customerReviewView = UIView()
    private let customerReviewViewTitle = UILabel()
    private var customerReviewViewStarStackView = UIStackView()
    private let customerReviewViewDateLabel = UILabel()
    private let customerNameLabel = UILabel()
    private let customerReviewLabel = UILabel()
    private let developerReviewView = UIView()
    private let developerReviewViewTitle = UILabel()
    private let developerReviewViewDateLabel = UILabel()
    private let developerReviewLabel = UILabel()
    
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

        customerReviewViewTitle.do {
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        customerReviewViewStarStackView.do {
            $0.axis = .horizontal
            
            for _ in 0..<5 {
                let customerStarImageView = UIImageView() // 새로운 UIImageView 인스턴스 생성
                customerStarImageView.image = UIImage(systemName: "star.fill")
                customerStarImageView.contentMode = .scaleAspectFit
                customerStarImageView.tintColor = .orange
                customerStarImageView.snp.makeConstraints { $0.size.equalTo(16) }
                $0.addArrangedSubview(customerStarImageView)
            }
        }
        
        customerReviewViewDateLabel.do {
            $0.textColor = .gray
            $0.font = .systemFont(ofSize: 16)
        }
        
        customerNameLabel.do {
            $0.textColor = .gray
            $0.font = .systemFont(ofSize: 16)
        }
        
        customerReviewLabel.do {
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 3
        }
        
        developerReviewViewTitle.do {
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        developerReviewViewDateLabel.do {
            $0.textColor = .gray
            $0.font = .systemFont(ofSize: 16)
        }
        
        developerReviewLabel.do {
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 2
        }
    }
    
    private func setUI() {
        contentView.addSubviews(customerReviewView, developerReviewView)
        
        customerReviewView.addSubviews(customerReviewViewTitle, customerReviewViewStarStackView, customerReviewViewDateLabel, customerNameLabel, customerReviewLabel)
        developerReviewView.addSubviews(developerReviewViewTitle, developerReviewViewDateLabel, developerReviewLabel)
    }
    
    private func setLayout() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        customerReviewView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(20)
            $0.height.equalTo(150)
            $0.width.equalTo(370)
        }
        
        customerReviewViewTitle.snp.makeConstraints {
            $0.leading.equalTo(customerReviewView).inset(20)
            $0.top.equalTo(customerReviewView).inset(20)
        }
        
        customerReviewViewStarStackView.snp.makeConstraints {
            $0.leading.equalTo(customerReviewViewTitle)
            $0.top.equalTo(customerReviewViewTitle.snp.bottom).offset(5)
        }
        
        customerReviewViewDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        
        customerNameLabel.snp.makeConstraints {
            $0.trailing.equalTo(customerReviewViewDateLabel)
            $0.top.equalTo(customerReviewViewDateLabel.snp.bottom).offset(5)
        }
        
        customerReviewLabel.snp.makeConstraints {
            $0.leading.equalTo(customerReviewViewTitle)
            $0.top.equalTo(customerReviewViewStarStackView.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(20)
        }
        
        developerReviewView.snp.makeConstraints {
            $0.leading.equalTo(customerReviewView)
            $0.top.equalTo(customerReviewView.snp.bottom)
            $0.width.equalTo(370)
        }
        
        developerReviewViewTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        
        developerReviewViewDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        
        developerReviewLabel.snp.makeConstraints {
            $0.leading.equalTo(developerReviewViewTitle)
            $0.top.equalTo(developerReviewViewTitle.snp.bottom).offset(10)
            $0.width.equalToSuperview().inset(20)
        }
        
    }
    
    func configure(with review: TossReview) {
        customerReviewViewTitle.text = review.customerReviewViewTitle
        customerReviewViewDateLabel.text = review.customerReviewViewDateLabel
        customerNameLabel.text = review.customerNameLabel
        customerReviewLabel.text = review.customerReviewLabel
        developerReviewViewTitle.text = review.developerReviewViewTitle
        developerReviewViewDateLabel.text = review.developerReviewViewDateLabel
        developerReviewLabel.text = review.developerReviewLabel
    }
}
