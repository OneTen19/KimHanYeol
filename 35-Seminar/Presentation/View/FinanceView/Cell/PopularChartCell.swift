//
//  PopularChartCell.swift
//  35-Seminar
//
//  Created by OneTen on 10/28/24.
//

import UIKit

import SnapKit

class PopularChartCell: UITableViewCell {
    
    private let iconImageView = UIImageView()
    private let rankLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let downloadButton = UIButton()
    
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
        
    }
    
    private func setUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(rankLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(downloadButton)
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.top.equalTo(iconImageView).offset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
            $0.width.equalTo(200)
            $0.top.equalTo(rankLabel)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
            $0.width.equalTo(200)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }
    }
    
    func configure(with app: App) {
        iconImageView.image = app.iconImage
        rankLabel.text = app.ranking.description
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle ?? app.category.rawValue
        downloadButton.setTitle(app.downloadState.title, for: .normal)
        downloadButton.setImage(app.downloadState.image, for: .normal)
    }
}

