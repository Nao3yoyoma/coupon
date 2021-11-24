//
//  TwitterCoupon.swift
//  coupon
//
//  Created by 植田直人 on 2021/11/18.
//

import Foundation

struct TwitterCoupon {

    // Tweetしたユーザのid
    let authorId: String

    // Tweet時刻
    let createdAt: String

    // Tweetのid
    let id: String

    // Tweetの本文
    let text: String

    // このツイートを発言したユーザー
    let user: User

    init?(json: Any, users: [Any]) {
        guard let dictionary = json as? [String: Any] else { return nil }

        guard let authorId = dictionary["author_id"] as? String else { return nil }
        guard let createdAt = dictionary["created_at"] as? String else { return nil }
        guard let id = dictionary["id"] as? String else { return nil }
        guard let text = dictionary["text"] as? String else { return nil }

        self.authorId = authorId
        self.createdAt = createdAt
        self.id = id
        self.text = text

        for userJson in users {
            guard let user = userJson as? [String: Any] else { return nil }
            guard let userId = user["id"] as? String else { return nil }
            if self.authorId == userId {
                self.user = User(json: user)?
                break
            }
        }
    }
}
