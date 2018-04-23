//
//  TheyUseCollectionCell.swift
//  News_c
//
//  Created by 杨博兴 on 2018/4/13.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit
import Kingfisher
import IBAnimatable


class TheyUseCollectionCell: UICollectionViewCell, RegisterCellFromNib {
    
    var vipImageView: UIImageView!
    var avatarImagView: AnimatableImageView
    var nameLabel : UILabel!
    var subtitleLabel : UILabel!
    var concernButton: AnimatableButton!
    var closeButton : UIButton!
    
    var loadingImageView: UIImageView!
    
    
    var userCard = UserCard() {
        didSet {
            
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
