//
//  PageCVC.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

import SnapKit

class PageCVC: UICollectionViewCell {
    
    static let identifier = "PageCVC"
    
    // MARK: - Properties
    
    private let item = ItemBrain()
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    
    private lazy var kurlyRecommendCV = UICollectionView(
        frame: .zero, collectionViewLayout: layout).then {
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = false
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section, Item>
    
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
        contentView.addSubview(kurlyRecommendCV)
        
        kurlyRecommendCV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension PageCVC {
    func configureDataSource() {
        let bannerCellRegistration = UICollectionView.CellRegistration<BannerCVC, Item> { (cell, indexPath, banner) in
            cell.bannerImageView.image = banner.image
        }
        
        let productCellRegistration = UICollectionView.CellRegistration<ProductCVC, Item> { (cell, indexPath, product) in
            
        }
        
//        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
//            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Video) -> UICollectionViewCell? in
//            // Return the cell.
//            return
    }
    
}
