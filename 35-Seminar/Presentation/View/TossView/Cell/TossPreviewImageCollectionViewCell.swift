//
//  TossPreviewImageCollectionViewCell.swift
//  35-Seminar
//
//  Created by OneTen on 10/30/24.
//

import UIKit

class TossPreviewImageCollectionViewCell: UICollectionViewCell {
    
    private let previewImageView = UIImageView()
    
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
        previewImageView.do {
            $0.contentMode = .scaleToFill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius = 30
            $0.clipsToBounds = true
        }
    }
    
    private func setUI() {
        contentView.addSubview(previewImageView)
    }
    
    private func setLayout() {
        previewImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with image: UIImage) {
        previewImageView.image = image
    }
    
}
