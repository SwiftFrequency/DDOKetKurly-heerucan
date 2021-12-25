//
//  Section.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/18.
//

import Foundation

enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
    case banner, product, longBanner

    var description: String {
        switch self {
        case .banner: return "Banner"
        case .product: return "Product Recommend"
        case .longBanner: return "Lone Banner"
        }
    }
}
