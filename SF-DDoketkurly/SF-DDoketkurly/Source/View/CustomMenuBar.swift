//
//  CustomMenuBar.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/18.
//

import UIKit

import SnapKit
import Then

class CustomMenuBar: UIView {

    // MARK: - Properties
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    private lazy var menuCV = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.isScrollEnabled = false
        
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    func configUI() {
        backgroundColor = .white
    }
    
    func setupAutoLayout() {
        
    }
    
    // MARK: - Custom Method


}
