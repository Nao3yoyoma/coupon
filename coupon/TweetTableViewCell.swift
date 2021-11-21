//
//  TweetTableViewCell.swift
//  coupon
//
//  Created by 植田直人 on 2021/11/19.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    // アイコンを表示するUIImageView
    @IBOutlet weak var iconImageView: UIImageView!
    // 名前を表示するUILabel
    @IBOutlet weak var nameLabel: UILabel!
    // スクリーンネームを表示するUILabel
    @IBOutlet weak var screenNameLabel: UILabel!
    // ツイート本文を表示するUILabel
    @IBOutlet weak var textContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fill(tweet: TwitterCoupon) {
        // TODO tweetから値を取り出して、UIにセットする
        //nameLabel.text = tweet.user.name
        textContentLabel.text = tweet.text
        // screenNameには "@" が含まれていないので、頭に "@" を入れてあげる必要がある
        //screenNameLabel.text = "@" + tweet.user.screenName
    }
}
