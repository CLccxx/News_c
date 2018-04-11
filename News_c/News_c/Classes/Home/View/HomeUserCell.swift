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

    lazy var topView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var bottomView : UIView = {
       let view = UIView()
        return view
    }()
    
    lazy var linView : UIView = {
        let view = UIView()
        return view
    }()
    
    var separatorView: UIView!
    var avatarImageView: UIImageView!
    var vipImageView: UIImageView!
    
    var nameLabel: UILabel!
    var verifiedContentLabel: UILabel!
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
            verifiedContentLabel.text = aNews.verified_content
            digButton.setTitle(aNews.diggCount, for: .normal)
            commentButton.setTitle("\(aNews.commentCount)", for: .normal)
            feedshareButton.setTitle("\(aNews.forwardCount)", for: .normal)
            contentLabel.attributedText = aNews.attributedContent
        }
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        
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


extension HomeUserCell {
    
    func setUpUI() -> Void {
        // creat ui
        avatarImageView = UIImageView()
        nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.textColor = UIColor.black
        verifiedContentLabel = UILabel()
        verifiedContentLabel.font = UIFont.systemFont(ofSize: 13)
        verifiedContentLabel.textColor = UIColor.init(r: 170, g: 170, b: 170)
        closeButton = UIButton(type: .custom)
        closeButton.setImage(UIImage(named: "add_textpage_17x12_"), for: .normal)
        
        concernButton = UIButton(type: .custom)
        concernButton.setTitle("关注", for: .normal)
        concernButton.setTitleColor(UIColor.init(r: 76, g: 173, b: 253), for: .normal)
        
        contentLabel = UILabel()
        contentLabel.textColor = UIColor.black
        contentLabel.font = UIFont.systemFont(ofSize: 16.0)
        contentLabel.contentMode = .left
        
        digButton = UIButton(type: .custom)
        digButton.setTitle("赞", for: .normal)
        digButton.setImage(UIImage(named: "like_old_feed_24x24_"), for: .normal)
        digButton.setTitleColor(UIColor.init(r: 117, g: 117, b: 117), for: .normal)
        
        commentButton = UIButton(type: .custom)
        commentButton.setTitle("评论", for: .normal)
        commentButton.setImage(UIImage(named: "comment_24x24_"), for: .normal)
        commentButton.setTitleColor(UIColor.init(r: 117, g: 117, b: 117), for: .normal)
        
        feedshareButton = UIButton(type: .custom)
        feedshareButton.setTitle("", for: .normal)
        feedshareButton.setImage(UIImage(named: "feed_share_24x24_"), for: .normal)
        feedshareButton.setTitleColor(UIColor.init(r: 117, g: 117, b: 117), for: .normal)
        
        // set night image
        closeButton.theme_setImage("images.add_textpage_17x12_", forState: .normal)
        nameLabel.theme_textColor = "colors.black"
        verifiedContentLabel.theme_textColor = "colors.cellRightTextColor"
        readCountLabel.theme_textColor = "colors.cellRightTextColor"
        contentView.theme_backgroundColor = "colors.cellBackgroundColor"
        digButton.theme_setImage("images.like_old_feed_24x24_", forState: .normal)
        digButton.theme_setImage("images.like_old_feed_press_24x24_", forState: .selected)
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        commentButton.theme_setImage("images.comment_24x24_", forState: .normal)
        feedshareButton.theme_setImage("images.feed_share_24x24_", forState: .normal)
        
        // add subview
        self.contentView.addSubview(self.topView)
        self.topView.addSubview(avatarImageView)
        self.avatarImageView.addSubview(vipImageView)
        self.topView.addSubview(nameLabel)
        self.topView.addSubview(verifiedContentLabel)
        self.topView.addSubview(concernButton)
        self.topView.addSubview(closeButton)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(self.bottomView)
        self.bottomView.addSubview(digButton)
        self.bottomView.addSubview(commentButton)
        self.bottomView.addSubview(readCountLabel)
        self.bottomView.addSubview(feedshareButton)
        self.bottomView.addSubview(self.linView)
        self.contentView.addSubview(separatorView)
        
        // set layout
        self.topView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        self.avatarImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.topView).offset(15)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        self.vipImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-3)
            make.bottom.equalToSuperview().offset(-3)
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImageView.snp.right).offset(5)
            make.top.equalTo(self.avatarImageView).offset(5)
            
        }
        self.verifiedContentLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.nameLabel)
            make.bottom.equalTo(self.avatarImageView)
        }
        self.closeButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 20, height: 14))
        }
        self.concernButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.closeButton.snp.left).offset(15)
            make.left.equalTo(self.nameLabel.snp.right).offset(-10)
            make.width.equalTo(40)
            make.centerY.equalToSuperview()
        }
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.topView.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
        self.bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        self.linView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        self.readCountLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.right.equalToSuperview()
            make.height.equalTo(20)
        }
        self.digButton.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(self.linView)
            make.right.equalTo(self.commentButton)
        }
        self.commentButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.digButton)
            make.size.equalTo(self.digButton)
        }
        self.feedshareButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.commentButton.snp.right)
            make.right.equalToSuperview()
            make.centerY.equalTo(self.digButton)
            make.size.equalTo(self.digButton)
        }
        self.separatorView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(10)
        }
    }
}
