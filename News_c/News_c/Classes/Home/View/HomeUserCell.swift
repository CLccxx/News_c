//
//  HomeUserCell.swift
//  News_c
//
//  Created by 杨博兴 on 2018/3/29.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class HomeUserCell: UITableViewCell, RegisterCellFromNib {

    var separatorView: UIView!
    var avatarImageView: UIImageView!
    var vipImageView: UIImageView!
    
    var nameLabel: UILabel!
    var verifiedcontentLabel: UILabel!
    var contentLabel: UILabel!
    var readCountLabel: UILabel!
    var concernButton: UIButton!
    var closeButton: UIButton!
    var digButton: UIButton!
    var commentButton: UIButton!
    var feedshareButton: UIButton!
    
    var aNews = NewsModel() {
        // 通过重写set方法实现
        didSet {
            // 发布者
            if aNews.source != "" {
                nameLabel.text = aNews.source
            }else if aNews.user.user_id != 0 {
                avatarImageView.kf.setImage(with: URL(string: aNews.user.avatar_url)!)
                nameLabel.text = aNews.user.screen_name
            }else if aNews.user_info.user_id != 0 {
                avatarImageView.kf.setImage(with: URL(string: aNews.user_info.avatar_url)!)
                nameLabel.text = aNews.user_info.name
            }else if aNews.media_info.user_id != 0 {
                nameLabel.text = aNews.media_info.name
                avatarImageView.kf.setImage(with: URL(string: aNews.media_info.avatar_url)!)
            }
            readCountLabel.text = " \(aNews.readCount)阅读"
            verifiedcontentLabel.text = aNews.verified_content
            digButton.setTitle(aNews.diggCount, for: .normal)
            commentButton.setTitle("\(aNews.commentCount)", for: .normal)
            feedshareButton.setTitle("\(aNews.forwardCount)", for: .normal)
            contentLabel.attributedText = aNews.attributedContent
        }
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
