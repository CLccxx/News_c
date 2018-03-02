//
//  HomeNavigationView.swift
//  News_c
//
//  Created by 杨博兴 on 2018/3/1.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit
import IBAnimatable

class HomeNavigationView: UIView , NibLoadable{

    @IBOutlet weak var avaterButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var searchButton: AnimatableButton!
    
    // 搜索按钮点击
    var didSelectSearchButton: (()->())?
    // 头像按钮点击
    var didSelectAvaterButton: (()->())?
    // 相机按钮点击
    var didSelectCameraButton: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchButton.theme_backgroundColor = "colors.cellBackgroundColor"
        searchButton.theme_setTitleColor("colors.grayColor150", forState: .normal)
        searchButton.setImage(UIImage.init(named: "search_small_16x16_"), for: [.normal ,.highlighted])
        
        cameraButton.theme_setImage("images.home_camera", forState: .normal)
        cameraButton.theme_setImage("images.home_camera", forState: .selected)
        
        avaterButton.theme_setImage("images.home_no_login_head", forState: .normal)
        avaterButton.theme_setImage("images.home_no_login_head", forState: .selected)
        
        // 获取首页顶部导航栏搜索推荐标题内容
        NetworkTool.loadHomeSearchSuggestInfo { (suggest) in
            self.searchButton.setTitle(suggest, for: .normal)
        }
    }
    
    // 固有的大小
    override var intrinsicContentSize: CGSize{
        return UILayoutFittingExpandedSize
    }
    
}
