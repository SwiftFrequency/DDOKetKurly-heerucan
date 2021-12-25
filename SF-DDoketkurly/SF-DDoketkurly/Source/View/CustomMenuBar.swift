//
//  CustomMenuBar.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/18.
//

import UIKit

import SnapKit
import Then

// MARK: - Delegate

protocol SelectMenuDelegate: HomeVC {
    func selectMenu(index: Int)
}

class CustomMenuBar: UIView {

    // MARK: - Properties
    
    public let menu = MenuBrain()
    
    public weak var selectMenuDelegate: SelectMenuDelegate?
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    public lazy var menuCV = UICollectionView(
        frame: .zero, collectionViewLayout: layout).then {
        $0.isScrollEnabled = false
        $0.showsHorizontalScrollIndicator = false
    }
    
    public var indicatorView = UIView().then {
        $0.backgroundColor = Asset.Colors.kurlyPurple.color
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func configure() {
        backgroundColor = .white
        
        addSubviews([menuCV, indicatorView, lineView])
        
        menuCV.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(41)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.top.equalTo(menuCV.snp.bottom)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(round((UIScreen.main.bounds.size.width)/5))
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    // MARK: - Custom Method

    private func setupCollectionView() {
        menuCV.delegate = self
        menuCV.dataSource = self
        menuCV.register(MenuCVC.self, forCellWithReuseIdentifier: MenuCVC.identifier)
    }
}

// MARK: - UICollectionViewDelegate

extension CustomMenuBar: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMenuDelegate?.selectMenu(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuCVC else { return }
        cell.menuLabel.textColor = Asset.Colors.textGray.color
    }
}

// MARK: - UICollectionViewDataSource

extension CustomMenuBar: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.getMenuCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCVC.identifier, for: indexPath) as? MenuCVC else { return UICollectionViewCell() }
        cell.menuLabel.text = menu.getMenuText(index: indexPath.item)
        if indexPath.item == 0 {
            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CustomMenuBar: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: round(UIScreen.main.bounds.size.width/5), height: self.bounds.height)
    }
}
