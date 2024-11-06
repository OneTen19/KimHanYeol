//
//  AppTileView.swift
//  35-Seminar
//
//  Created by OneTen on 10/30/24.
//

import UIKit

class AppTileView: UITableViewCell {
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let downloadButton = UIButton()
    private let inAppPriceLabel = UILabel()
    private let rankLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
        iconImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        }
        
        rankLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.numberOfLines = 1
        }
        
        subTitleLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.numberOfLines = 1
        }
        
        downloadButton.do {
            $0.setTitleColor(.tintColor, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .gray.withAlphaComponent(0.2)
            $0.clipsToBounds = true
        }
        
        inAppPriceLabel.do {
            $0.font = .systemFont(ofSize: 10, weight: .semibold)
            $0.textColor = .gray
        }
        
    }
    
    private func setUI() {
        contentView.addSubviews(iconImageView, titleLabel, rankLabel, subTitleLabel, downloadButton, inAppPriceLabel)
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(80)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.top.equalTo(iconImageView).offset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
            $0.width.equalTo(150)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
            $0.width.equalTo(150)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
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
        if app.ranking != 0 {
            rankLabel.text = app.ranking.description
        }
        subTitleLabel.text = app.subTitle ?? app.category.rawValue
        downloadButton.setTitle(app.price == 0 ? app.downloadState.title : "₩\(app.price)", for: .normal)
        downloadButton.setImage(app.downloadState.image, for: .normal)
        inAppPriceLabel.text = app.inAppPrice ? "앱 내 구입" : ""
    }
    
}
