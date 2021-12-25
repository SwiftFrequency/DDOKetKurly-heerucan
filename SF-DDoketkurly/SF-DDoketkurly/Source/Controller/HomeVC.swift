//
//  HomeVC.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/15.
//

import UIKit

import SnapKit
import Then

class HomeVC: UIViewController {
    
    // MARK: - Properties
    
    private let naviBar = NaviBar()
    private let menuBar = CustomMenuBar()
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    private lazy var pageCV = UICollectionView(
        frame: .zero, collectionViewLayout: layout).then {
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupCollectionView()
    }
    
    // MARK: - UI & Layout
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubviews([naviBar, menuBar, pageCV])
        
        naviBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        menuBar.snp.makeConstraints { make in
            make.top.equalTo(naviBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        pageCV.snp.makeConstraints { make in
            make.top.equalTo(menuBar.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    private func setupCollectionView() {
        pageCV.delegate = self
        pageCV.dataSource = self
        pageCV.register(PageCVC.self, forCellWithReuseIdentifier: PageCVC.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCVC.identifier, for: indexPath) as? PageCVC else { return UICollectionViewCell() }
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.pageCV.frame.height)
    }
}
