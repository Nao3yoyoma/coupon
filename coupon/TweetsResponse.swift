//
//  TweetsResponse.swift
//  coupon
//
//  Created by 植田直人 on 2021/11/21.
//

import Foundation

struct TweetsResponse{

    // TweetModel.swiftを参照
    // APIの結果によって存在するかが異なるため、ない場合を想定し、「?(Optional型)」をつけます。
    // こうすることで、存在しない場合はnilを返却してくれるようになります。
    var data: [TwitterCoupon]?

    init?(json: Any) {
        guard let dictionary = json as? [String: Any] else { return nil }
        guard let datas = dictionary["data"] as? [Any] else { return nil }
        self.data = datas.compactMap {
            TwitterCoupon(json: $0)
        }
    }
}
