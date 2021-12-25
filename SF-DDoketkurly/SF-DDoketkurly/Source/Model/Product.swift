//
//  Item.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

struct Product: Hashable {
    
    let name: String?
    let image: UIImage
    let price: String?
    let discount: Int?
    let discountPrice: String?
    
    private var id = UUID()

    init(name: String? = nil,
         image: UIImage,
         price: String? = nil,
         discount: Int? = nil,
         discountPrice: String? = nil) {
        self.name = name
        self.image = image
        self.price = price
        self.discount = discount
        self.discountPrice = discountPrice
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
