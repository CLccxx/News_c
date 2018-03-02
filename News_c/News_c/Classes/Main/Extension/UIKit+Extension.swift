//
//  UIKit+Extension.swift
//  News_c
//
//  Created by 杨博兴 on 2018/2/28.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit
import CoreText

protocol StoryboardLoadable {
//    func loadStoryboard() -> Self
    
}

// swift中 代理的扩展可以实现方法
// 如果遵守委托的类实现了代理方法，则覆盖此实现。
extension StoryboardLoadable where Self : UIViewController {
    // 提供 加载方法
    func loadStoryboard() -> Self {
        return UIStoryboard(name: "\(self)", bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! Self
    }
}

protocol NibLoadable {
//    func loadViewFromNib() -> Self
}

extension NibLoadable {
    static func loadViewFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
    
}
