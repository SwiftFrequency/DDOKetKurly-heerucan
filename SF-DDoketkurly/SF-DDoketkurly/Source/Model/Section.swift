//
//  Section.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/18.
//

import Foundation

class Section: Hashable {
    
    var id = UUID()
    var menu: String
    
    init(menu: String) {
        self.menu = menu
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.id == rhs.id
    }
}
