//
//  LongBannerCVC.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/26.
//

import UIKit

import SnapKit
import Then

class LongBannerCVC: UICollectionViewCell {
    
    static let identifier = "LongBannerCVC"

    // MARK: - Properties
    
    public let bannerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
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
    
    public func configure() {
        contentView.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(76)
        }
    }
}
