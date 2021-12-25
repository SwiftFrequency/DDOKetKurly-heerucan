//
//  ProductCVC.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

class ProductCVC: UICollectionViewCell {
    
    static let identifier = "ProductCVC"
    
    // MARK: - Properties
    
    public let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let cartButton = UIButton(type: .system).then {
        $0.layer.cornerRadius = 37 / 2
        $0.clipsToBounds = true
        $0.setBackgroundImage(Asset.Assets.btnCart.image, for: .normal)
        $0.alpha = 0.7
    }
    
    public let productLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 2
    }
    
    public let discountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = Asset.Colors.textOrange.color
    }
    
    public let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    public let discountPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = Asset.Colors.textGray.color
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func configure() {
        contentView.addSubviews([productImageView,
                                 cartButton,
                                 productLabel,
                                 discountLabel,
                                 priceLabel,
                                 discountPriceLabel])
        
        productImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(195)
        }
        
        cartButton.snp.makeConstraints { make in
            make.bottom.equalTo(productImageView.snp.bottom).inset(8)
            make.trailing.equalTo(productImageView.snp.trailing).inset(7)
            make.width.height.equalTo(37)
        }
        
        productLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(11)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(6)
        }
        
        discountLabel.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(8)
            make.leading.equalTo(discountLabel.snp.trailing).offset(7)
        }
        
        discountPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(discountLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(6)
        }
    }
}
