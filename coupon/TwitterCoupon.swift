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

    init(authorId: String, createdAt: String, id: String, text: String, user: User) {
        self.authorId = authorId
        self.createdAt = createdAt
        self.id = id
        self.text = text
        self.user = user
    }

    init?(json: Any, users: [Any]) {
        guard let dictionary = json as? [String: Any] else { return nil }

        guard let authorId = dictionary["author_id"] as? String else { return nil }
        guard let createdAt = dictionary["created_at"] as? String else { return nil }
        guard let id = dictionary["id"] as? String else { return nil }
        guard let text = dictionary["text"] as? String else { return nil }

        var user: User = User()
        for userJson in users {
            guard let temp = userJson as? [String: Any] else { return nil }
            guard let userId = temp["id"] as? String else { return nil }
            guard authorId == userId else { continue }
            user = User(json: temp)!
            break
        }

        self.authorId = authorId
        self.createdAt = createdAt
        self.id = id
        self.text = text
        self.user = user
    }
}
