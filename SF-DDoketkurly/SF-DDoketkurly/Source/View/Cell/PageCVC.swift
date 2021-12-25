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
    static let titleElementKind = "title-element-kind"
    
    // MARK: - Properties
    
    private let itemBrain = ItemsBrain()
    
    private lazy var kurlyRecommendCV = UICollectionView(
        frame: .zero, collectionViewLayout: createLayout())
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Items>!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureDataSource()
        applySnapshot()
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

// MARK: - Extension : Compositional Layout

extension PageCVC {
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            
            let section: NSCollectionLayoutSection
            
            if sectionKind == .banner {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(340))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
            } else if sectionKind == .product {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0, leading: 4, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .estimated(150),
                    heightDimension: .estimated(280))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize, subitems: [item])
                
                let sectionHeader = self.createSectionHeader()
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [sectionHeader]
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0, leading: 16, bottom: 32, trailing:16)
                
            }  else if sectionKind == .longBanner {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(76))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
            } else {
                fatalError("Unknown section!")
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(73))
        
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: PageCVC.titleElementKind,
            alignment: .top)
        return layoutSectionHeader
    }
}

// MARK: - Extension : Data Source + Apply

extension PageCVC {
    
    /// 이 부분 Model 비즈니스 로직으로 옮겨줘야 할 거 같은데 뭔가 너무 더러워...
    private func configureDataSource() {
        let bannerCellRegistration = UICollectionView.CellRegistration<BannerCVC, Items> { (cell, indexPath, items) in
            cell.bannerImageView.image = self.itemBrain.getBannerImage(index: indexPath.row)
        }
        
        let productCellRegistration = UICollectionView.CellRegistration<ProductCVC, Items> { (cell, indexPath, items) in
            cell.productImageView.image = self.itemBrain.getProductData(index: indexPath.row).image
            cell.productLabel.text = self.itemBrain.getProductData(index: indexPath.row).name
            cell.discountLabel.text = "\(String(describing: self.itemBrain.getDiscountData(index: indexPath.row)))%"
            cell.priceLabel.text = self.itemBrain.getProductData(index: indexPath.row).price
            cell.discountPriceLabel.text = self.itemBrain.getProductData(index: indexPath.row).discountPrice
        }
        
        let longBannerCellRegistration = UICollectionView.CellRegistration<LongBannerCVC, Items> { (cell, indexPath, items) in
            cell.bannerImageView.image = self.itemBrain.getlongBannerImage(index: indexPath.row)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Items>(collectionView: kurlyRecommendCV) {
            (collectionView: UICollectionView, indexPath: IndexPath, items: Items) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            switch section {
            case .banner:
                return collectionView.dequeueConfiguredReusableCell(
                    using: bannerCellRegistration,
                    for: indexPath,
                    item: items.category.items.first)
            case .product:
                return collectionView.dequeueConfiguredReusableCell(
                    using: productCellRegistration,
                    for: indexPath,
                    item: items.category.items.last)
            case .longBanner:
                return collectionView.dequeueConfiguredReusableCell(
                    using: longBannerCellRegistration,
                    for: indexPath,
                    item: items.category.items.last)
            }
        }
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration
        <TitleSupplementaryView>(elementKind: PageCVC.titleElementKind) {
            supplementaryView, elementKind, indexPath in
        }
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return self.kurlyRecommendCV.dequeueConfiguredReusableSupplementary(
                using: supplementaryRegistration, for: index)
        }
    }
    
    func applySnapshot() {
        /// Section 추가
        let sections = Section.allCases
        var snapshot = NSDiffableDataSourceSnapshot<Section, Items>()
        snapshot.appendSections(sections)
        
        /// BannerItem 추가
        let bannerItems = Items.Category.banner.items
        var bannerSnapshot = NSDiffableDataSourceSectionSnapshot<Items>()
        bannerSnapshot.append(bannerItems)
        dataSource.apply(bannerSnapshot, to: .banner, animatingDifferences: true)
        
        /// ProductItem 추가
        let productItems = Items.Category.product.items
        var productSnapshot = NSDiffableDataSourceSectionSnapshot<Items>()
        productSnapshot.append(productItems)
        dataSource.apply(productSnapshot, to: .product, animatingDifferences: true)
        
        /// ProductItem 추가
        let longBannerItems = Items.Category.longBanner.items
        var longBannerSnapshot = NSDiffableDataSourceSectionSnapshot<Items>()
        longBannerSnapshot.append(longBannerItems)
        dataSource.apply(longBannerSnapshot, to: .longBanner, animatingDifferences: true)
    }
}
