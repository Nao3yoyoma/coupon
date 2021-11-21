//
//  TwitterCouponParser.swift
//  coupon
//
//  Created by 植田直人 on 2021/11/21.
//

import Foundation

struct TwitterCouponParser {
    func parse(data: Data) -> TweetsResponse? {

        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        let coupons = TweetsResponse(json: json)

        return coupons
    }
}
