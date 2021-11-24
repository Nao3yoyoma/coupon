//
//  TweetsResponse.swift
//  coupon
//
//  Created by 植田直人 on 2021/11/21.
//

import Foundation

struct TweetsResponse{

    var data: [TwitterCoupon]

    init?(json: Any) {
        guard let dictionary = json as? [String: Any] else { return nil }
        guard let datas = dictionary["data"] as? [Any] else { return nil }
        guard let includes = dictionary["includes"] as? [String: Any] else { return nil }
        guard let users = includes["users"] as? [Any] else { return nil }
        self.data = datas.compactMap {
            TwitterCoupon(json: $0, users: users)
        }
    }
}
