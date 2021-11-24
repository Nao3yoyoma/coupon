//
//  User.swift
//  coupon
//
//  Created by 植田直人 on 2021/11/18.
//

import Foundation

struct User {

    // ユーザーのid
    let id: String

    // スクリーン名
    let screenName: String

    // ユーザ名
    let name: String

    // プロフィール画像URL
    let profileImageURL: String

    init?(json: Any) {
        guard let dictionary = json as? [String: Any] else { return nil }

        guard let id = dictionary["id"] as? String else { return nil }
        guard let screenName = dictionary["username"] as? String else { return nil }
        guard let name = dictionary["name"] as? String else { return nil }
        guard let profileImageURL = dictionary["profile_image_url"] as? String else { return nil }

        self.id = id
        self.screenName = screenName
        self.name = name
        self.profileImageURL = profileImageURL
    }
}
