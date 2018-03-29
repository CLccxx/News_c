//
//  Calculate.swift
//  News_c
//
//  Created by 杨博兴 on 2018/3/28.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit

// 结构体Calculate遵守协议
protocol Calculatable {
    // MARK :- 计算宽度
    static func collectionViewWidth(_ count : Int) -> CGFloat
    // MARK :- 计算高度
    static func collectionViewHeight(_ count : Int) -> CGFloat
    // MARK :- 计算collectionViewCell的大小
    static func collectionViewCellSize(_ count : Int) -> CGSize
    
}

// 用于实现协议方法，如果自己实现了，则会覆盖扩展中的方法
extension Calculatable {
    // MARK :- 计算宽度 count 图片数量
    static func collectionViewWidth(_ count : Int) -> CGFloat {
        switch count {
        case 1,2:
            return (image2Width + 5) * 2
        case 3, 5...9:
            return (screenWidth - 30)
        case 4:
            return (image3Width + 5) * 2
        default:
            return 0
        }
    }
    // MARK :- 计算高度
    static func collectionViewHeight(_ count : Int) -> CGFloat {
        switch count {
        case 1,2:
            return image2Width
        case 3:
            return image3Width + 5
        case 4...6:
            return (image3Width + 5) * 2
        case 7...9:
            return (image3Width + 5) * 3
        default:
            return 0
        }
    }
    // MARK :- 计算collectionViewCell的大小
    static func collectionViewCellSize(_ count: Int) -> CGSize {
        switch count {
        case 1,2:
            return CGSize(width: image2Width, height: image2Width)
        case 3...9:
            return CGSize(width: image3Width, height: image3Width)
        default:
            return CGSize.zero
        }
    }
}

struct Calculate : Calculatable {
}
