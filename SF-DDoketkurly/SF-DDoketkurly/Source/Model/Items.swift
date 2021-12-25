//
//  Items.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/26.
//

import UIKit

struct Items: Hashable {
    
    enum Category: CaseIterable, CustomStringConvertible {
        case banner, product, longBanner
    }
    
    let image: UIImage
    let name: String?
    let price: String?
    let discount: Int?
    let discountPrice: String?
    let category: Category
    private let identifier = UUID()
}

extension Items.Category {
    
    var description: String {
        switch self {
        case .banner: return "Banner"
        case .product: return "Product"
        case .longBanner: return "LongBanner"
        }
    }
    
    var items: [Items] {
        switch self {
        case .banner:
            return [
                Items(image: Asset.Assets.imgBanner2.image, name: nil, price: nil, discount: nil, discountPrice: nil, category: self),
                Items(image: Asset.Assets.imgBanner3.image, name: nil, price: nil, discount: nil, discountPrice: nil, category: self),
                Items(image: Asset.Assets.imgBanner4.image, name: nil, price: nil, discount: nil, discountPrice: nil, category: self),
                Items(image: Asset.Assets.imgBanner5.image, name: nil, price: nil, discount: nil, discountPrice: nil, category: self),
                Items(image: Asset.Assets.imgBanner6.image, name: nil, price: nil, discount: nil, discountPrice: nil, category: self),
                Items(image: Asset.Assets.imgBanner7.image, name: nil, price: nil, discount: nil, discountPrice: nil, category: self)
            ]
            
        case .product:
            return [
                Items(image: Asset.Assets.imgProduct1.image,
                      name: "[존쿡] 슈바인학센 650g (냉동)",
                      price: "14,400원",
                      discount: 20,
                      discountPrice: "18,000원",
                      category: self),
                Items(image: Asset.Assets.imgProduct2.image,
                      name: "[카페 뎀셀브즈] 콜드브루 515mL",
                      price: "11,352원",
                      discount: 14,
                      discountPrice: "13,200원",
                      category: self),
                Items(image: Asset.Assets.imgProduct3.image,
                      name: "친환경 도라지 150g",
                      price: "4,990원",
                      discount: nil,
                      discountPrice: nil,
                      category: self),
                Items(image: Asset.Assets.imgProduct4.image,
                      name: "[씨즐푸드] 우리밀 통살 치킨까스 (냉동)",
                      price: "4,400원",
                      discount: 20,
                      discountPrice: "5,000원",
                      category: self),
                Items(image: Asset.Assets.imgProduct5.image,
                      name: "[아리조나] 아이스티 500mL",
                      price: "2,800원",
                      discount: 20,
                      discountPrice: nil,
                      category: self),
                Items(image: Asset.Assets.imgProduct6.image,
                      name: "[레보니] 산 다니엘레 프로슈토",
                      price: "8,400원",
                      discount: 10,
                      discountPrice: "9,600원",
                      category: self)
            ]
        case .longBanner:
            return [
                Items(image: Asset.Assets.imgLongBanner.image,
                      name: nil, price: nil, discount: nil, discountPrice: nil, category: self),
                Items(image: Asset.Assets.imgLongBanner2.image,
                      name: nil, price: nil, discount: nil, discountPrice: nil, category: self),
                Items(image: Asset.Assets.imgLongBanner3.image,
                      name: nil, price: nil, discount: nil, discountPrice: nil, category: self)
            ]
        }
    }
}

struct ItemsBrain {
    
    func getBannerImage(index: Int) -> UIImage {
        return Items.Category.banner.items[index].image
    }
    
    func getProductData(index: Int) -> Items {
        return Items.Category.product.items[index]
    }
    
    func getDiscountData(index: Int) -> Int {
        guard let discount = Items.Category.product.items[index].discount else { return Int()}
        return discount
    }
    
    func getlongBannerImage(index: Int) -> UIImage {
        return Items.Category.longBanner.items[index].image
    }
}
