//
//  HorizontalCollectionViewCell.swift
//  35-Seminar
//
//  Created by OneTen on 10/30/24.
//

import UIKit

class HorizontalCollectionWithBackgroundImageCell: UICollectionViewCell {
    
    private let headerTypeLabel = UILabel()
    private let headerTitleLabel = UILabel()
    private let headerSubTitleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let downloadButton = UIButton()
    private let appBackgroundImageView = UIImageView()
    private let inAppPriceLabel = UILabel()
    private let gradientLayer = CAGradientLayer()
    
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
        headerTypeLabel.do {
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
            $0.textColor = .tintColor
        }
        
        headerTitleLabel.do {
            $0.font = .systemFont(ofSize: 28, weight: .semibold)
        }
        
        headerSubTitleLabel.do {
            $0.font = .systemFont(ofSize: 22, weight: .semibold)
            $0.textColor = .gray
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.textColor = .white
        }
        
        subTitleLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.textColor = .white.withAlphaComponent(0.7)
        }
        
        appBackgroundImageView.do {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        gradientLayer.do {
            $0.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.6).cgColor]
            $0.locations = [0.0, 1.0]
            $0.startPoint = CGPoint(x: 0.5, y: 0.0)
            $0.endPoint = CGPoint(x: 0.5, y: 1.0)
            $0.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
        }
        
        downloadButton.do {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.layer.cornerRadius = 20
            $0.backgroundColor = .white.withAlphaComponent(0.4)
            $0.clipsToBounds = true
        }
        
        inAppPriceLabel.do {
            $0.font = .systemFont(ofSize: 10, weight: .semibold)
            $0.textColor = .white.withAlphaComponent(0.5)
        }
        
    }
    
    private func setUI() {
        contentView.addSubviews(headerTypeLabel, headerTitleLabel, headerSubTitleLabel, appBackgroundImageView, iconImageView, titleLabel, subTitleLabel, downloadButton, inAppPriceLabel)
        
        appBackgroundImageView.layer.addSublayer(gradientLayer)
    }
    
    private func setLayout() {
        headerTypeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(10)
        }
        
        headerTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(headerTypeLabel)
            $0.top.equalTo(headerTypeLabel.snp.bottom).offset(4)
            $0.width.equalToSuperview().inset(20)
        }
        
        headerSubTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(headerTitleLabel)
            $0.top.equalTo(headerTitleLabel.snp.bottom)
            $0.width.equalToSuperview().inset(20)
        }
    
        appBackgroundImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(headerSubTitleLabel.snp.bottom).offset(10)
            $0.height.equalTo(UIScreen.main.bounds.height/3)
        }
        
        iconImageView.snp.makeConstraints {
            $0.bottom.equalTo(appBackgroundImageView.snp.bottom).inset(20)
            $0.leading.equalTo(appBackgroundImageView.snp.leading).inset(20)
            $0.width.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.width.equalTo(180)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
            $0.width.equalTo(180)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalTo(appBackgroundImageView).inset(15)
            $0.centerY.equalTo(iconImageView)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        inAppPriceLabel.snp.makeConstraints {
            $0.top.equalTo(downloadButton.snp.bottom).offset(2)
            $0.centerX.equalTo(downloadButton)
        }
    }
    
    func configure(with app: App) {
        iconImageView.image = app.iconImage
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle ?? app.category.rawValue
        headerTitleLabel.text = app.title
        headerSubTitleLabel.text = app.subTitle ?? app.category.rawValue
        appBackgroundImageView.image = app.backgroundImage
        downloadButton.setTitle(app.price == 0 ? app.downloadState.title : "₩\(app.price)", for: .normal)
        downloadButton.setImage(app.downloadState.image, for: .normal)
        inAppPriceLabel.text = app.inAppPrice ? "앱 내 구입" : ""
        
        switch app.ranking {
        case 1: headerTypeLabel.text = "추천"
        case 2: headerTypeLabel.text = "새로운 경험"
        case 3: headerTypeLabel.text = "새로운 앱"
        default: headerTypeLabel.text = "추천"
        }
    }
    
}

