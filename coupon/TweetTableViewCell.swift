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

    /// tweetとユーザ情報から値を取り出して、UIにセットする
    func fill(tweet: TwitterCoupon?, user: User) {
        textContentLabel.text = tweet?.text
        nameLabel.text = user.name
        // screenNameには "@" が含まれていないので、頭に "@" を入れてあげる必要がある
        screenNameLabel.text = "@" + user.screenName
    }
}
