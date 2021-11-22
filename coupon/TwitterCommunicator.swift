//
//  TwitterCommunicator.swift
//  coupon
//
//  Created by 植田直人 on 2021/11/20.
//

import Foundation
import Social

class TwitterCommunicator {
    let tweetFields : String = "tweet.fields=author_id,id,text,created_at"
    let maxResults : String = "max_results=100"
    
    /// TwitterAPIから同期式でクーポン情報(json)を取得する
    /// - Returns: json形式のクーポン情報
    func getCouponFromTwitter(handler: @escaping (Data?, Error?) -> ())
    {
        var target : String = "(抽選 OR 応募) -is:retweet ("
        coupon.PrivateData.COUPON_ACCOUNTS.forEach {
            target.append("from:")
            target.append($0)
            if coupon.PrivateData.COUPON_ACCOUNTS.last != $0 {
                target.append(" OR ")
            }
        }
        target.append(")")

        let targetEncodeString = target.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        let query : String = "query=\(targetEncodeString!)"
        
        // Httpリクエストの生成
        // TODO URLコンポーネントを使用した形にしたい https://qiita.com/shungo_m/items/64564fd822a7558ac7b1
        var request = URLRequest(url: URL(string: "https://api.twitter.com/2/tweets/search/recent?\(query)&\(tweetFields)&\(maxResults)")!)
        request.addValue("Bearer \(coupon.PrivateData.BEARER)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        // HTTPリクエスト実行
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                handler(nil, error)
                return
            }

            handler(data, error)
        }
        task.resume()
    }
}
