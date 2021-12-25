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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupAutoLayout()
    }
    
    // MARK: - UI & Layout
    
    func configUI() {
        view.backgroundColor = .white
    }
    
    func setupAutoLayout() {
        view.addSubviews([naviBar])
        
        naviBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
    }
    
    // MARK: - Custom Method

}
