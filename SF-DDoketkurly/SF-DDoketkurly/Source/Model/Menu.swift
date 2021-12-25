//
//  Menu.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

struct Menu {
    var menu: String
    var color: UIColor
    
    init(menu: String, color: UIColor) {
        self.menu = menu
        self.color = color
    }
}

struct MenuBrain {
    let menu = [Menu(menu: "컬리추천", color: .white),
                Menu(menu: "신상품", color: .systemPink),
                Menu(menu: "베스트", color: .systemOrange),
                Menu(menu: "알뜰쇼핑", color: .systemYellow),
                Menu(menu: "특가/혜택", color: .systemPurple)]
    
    func getMenuCount() -> Int {
        return menu.count
    }
    
    func getMenuText(index: Int) -> String {
        return menu[index].menu
    }
    
    func getMenuColor(index: Int) -> UIColor {
        return menu[index].color
    }
}
