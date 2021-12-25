//
//  MenuCVC.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

import SnapKit
import Then

class MenuCVC: UICollectionViewCell {
    
    static let identifier = "MenuCVC"

    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                menuLabel.textColor = Asset.Colors.kurlyPurple.color
                menuLabel.font = .systemFont(ofSize: 14, weight: .semibold)
            } else {
                menuLabel.textColor = Asset.Colors.textGray.color
                menuLabel.font = .systemFont(ofSize: 14, weight: .regular)
            }
        }
     }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout

    public let menuLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.textColor = Asset.Colors.textGray.color
    }
    
    private func setupAutoLayout() {
        contentView.addSubview(menuLabel)
        
        menuLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
