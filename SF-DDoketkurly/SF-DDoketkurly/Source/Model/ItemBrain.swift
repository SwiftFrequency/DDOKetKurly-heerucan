//
//  ItemBrain.swift
//  SF-DDoketkurly
//
//  Created by Thisisme Hi on 2021/12/25.
//

import UIKit

struct ItemBrain {
    let bannerItem = [Item(name: nil, image: Asset.Assets.imgBanner7.image, price: nil, discount: nil, discountPrice: nil),
                      Item(name: nil, image: Asset.Assets.imgBanner2.image, price: nil, discount: nil, discountPrice: nil),
                      Item(name: nil, image: Asset.Assets.imgBanner3.image, price: nil, discount: nil, discountPrice: nil),
                      Item(name: nil, image: Asset.Assets.imgBanner4.image, price: nil, discount: nil, discountPrice: nil),
                      Item(name: nil, image: Asset.Assets.imgBanner5.image, price: nil, discount: nil, discountPrice: nil),
                      Item(name: nil, image: Asset.Assets.imgBanner6.image, price: nil, discount: nil, discountPrice: nil)]
    
    let productItem = [Item(name: "[존쿡] 슈바인학센 650g (냉동)",
                            image: Asset.Assets.imgProduct1.image,
                            price: "14,400원",
                            discount: 20,
                            discountPrice: "18,000원"),
                       Item(name: "[레보니] 산 다니엘레 프로슈토",
                            image: Asset.Assets.imgProduct2.image,
                            price: "8,400원",
                            discount: 10,
                            discountPrice: "9,600원"),
                       Item(name: "[아리조나] 아이스티 500mL",
                            image: Asset.Assets.imgProduct3.image,
                            price: "2,800원",
                            discount: 20,
                            discountPrice: nil),
                       Item(name: "[씨즐푸드] 우리밀 통살 치킨까스 (냉동)",
                            image: Asset.Assets.imgProduct4.image,
                            price: "4,400원",
                            discount: 20,
                            discountPrice: "5,000원"),
                       Item(name: "친환경 도라지 150g",
                            image: Asset.Assets.imgProduct5.image,
                            price: "4,990원",
                            discount: nil,
                            discountPrice: nil),
                       Item(name: "[카페 뎀셀브즈] 콜드브루 515mL",
                            image: Asset.Assets.imgProduct6.image,
                            price: "11,352원",
                            discount: 14,
                            discountPrice: "13,200원"),
                       Item(name: "친환경 대파 250g",
                            image: Asset.Assets.imgProduct7.image,
                            price: "2,490원",
                            discount: nil,
                            discountPrice: nil)]
}
