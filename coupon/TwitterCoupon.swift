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
    let createdAt: Date
    
    // Tweetのid
    let id: String

    // Tweetの本文
    let text: String
    
    init?(json: Any) {
        guard let dictionary = json as? [String: Any] else { return nil }
        
        guard let authorId = dictionary["author_id"] as? String else { return nil }
        guard let createdAt = dictionary["created_at"] as? Date else { return nil }
        guard let id = dictionary["id"] as? String else { return nil }
        guard let text = dictionary["text"] as? String else { return nil }
        
        self.authorId = authorId
        self.createdAt = createdAt
        self.id = id
        self.text = text
    }
}
