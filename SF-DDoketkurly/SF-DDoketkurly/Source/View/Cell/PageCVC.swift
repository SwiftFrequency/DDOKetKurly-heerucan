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
    
    private let item = Item()
        
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
        let bannerCellRegistration = UICollectionView.CellRegistration<BannerCVC, Banner> { (cell, indexPath, banner) in
            cell.bannerImageView.image = banner.image
        }
        
        let productCellRegistration = UICollectionView.CellRegistration<ProductCVC, Product> { (cell, indexPath, product) in
            cell.productImageView.image = product.image
            cell.productLabel.text = product.name
            cell.discountLabel.text = "\(String(describing: product.discount))%"
            cell.priceLabel.text = product.price
            cell.discountPriceLabel.text = product.discountPrice
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: kurlyRecommendCV) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            switch section {
            case .banner:
                return collectionView.dequeueConfiguredReusableCell(using: bannerCellRegistration, for: indexPath, item: item.banner)
            case .product:
                return collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item.product)
            }
        }
    }
}
