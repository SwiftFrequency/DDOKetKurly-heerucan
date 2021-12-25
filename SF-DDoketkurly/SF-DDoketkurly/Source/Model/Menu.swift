//
//  Menu.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import Foundation

struct Menu {
    var menu: String
    
    init(menu: String) {
        self.menu = menu
    }
}

struct MenuBrain {
    let menu = [Menu(menu: "컬리추천"),
                Menu(menu: "신상품"),
                Menu(menu: "베스트"),
                Menu(menu: "알뜰쇼핑"),
                Menu(menu: "특가/혜택")]
    
    func getMenuCount() -> Int {
        return menu.count
    }
    
    func getMenuText(index: Int) -> String {
        return menu[index].menu
    }
}
