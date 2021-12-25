//
//  Item.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

class Item: Hashable {
    
    private var id = UUID()
    let name: String?
    let image: UIImage?
    let price: Int?
    let discount: Int?
    let discountPrice: Int?
    
    init(name: String? = nil,
         image: UIImage? = nil,
         price: Int? = nil,
         discount: Int? = nil,
         discountPrice: Int? = nil) {
        self.name = name
        self.image = image
        self.price = price
        self.discount = discount
        self.discountPrice = discountPrice
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
}
