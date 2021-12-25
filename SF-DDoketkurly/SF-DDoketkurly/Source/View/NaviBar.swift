//
//  NaviBar.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/18.
//

import UIKit

import SnapKit
import Then

class NaviBar: UIView {

    // MARK: - Properties
    
    private let logoImageView = UIImageView().then {
        $0.image = Asset.Assets.iconLogo.image
        $0.contentMode = .scaleAspectFit
    }
    
    private let mapButton = UIButton().then {
        $0.setImage(Asset.Assets.btnMap.image, for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let cartButton = UIButton().then {
        $0.setImage(Asset.Assets.btnCart.image, for: .normal)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func configUI() {
        backgroundColor = Asset.Colors.kurlyPurple.color
    }
    
    private func setupAutoLayout() {
        addSubviews([logoImageView, mapButton, cartButton])
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(42)
            make.centerX.equalToSuperview()
        }
        
        mapButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalTo(cartButton.snp.leading).offset(-7)
            make.width.height.equalTo(34)
        }
        
        cartButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(14)
            make.width.height.equalTo(34)
        }
    }
}
