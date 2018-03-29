//
//  UserDeatil.swift
//  News_c
//
//  Created by 杨博兴 on 2018/3/28.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import Foundation
import HandyJSON


struct ThumbImage:HandyJSON {
    
    var type = ImageType.normal
    var height : CGFloat = 0
    var width : CGFloat = 0
    var url_list = [URLList]() // URL数组
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else {
            return url as String
        }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    
    var uri : String = ""
    // 宽高比
    var ratio : CGFloat {
        return width / height
    }
}

struct LargeImage : HandyJSON {
    var type = ImageType.normal
    var height : CGFloat = 0
    var url_list = [URLList]()
    
    var url : NSString = ""
    var urlString : String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    var width : CGFloat = 0
    var uri : String = ""
}


// MARK: 相关推荐模型
struct UserCard: HandyJSON {
    
    var name: String = ""
    
    var recommend_reason: String = ""
    
    var recommend_type: Int = 0
    
    var user: UserCardUser = UserCardUser()
    
    var stats_place_holder: String = ""
    
}

// MARK: 相关推荐的用户模型
struct UserCardUser: HandyJSON {
    
    var info: UserCardUserInfo = UserCardUserInfo()
    
    var relation: UserCardUserRelation = UserCardUserRelation()
    
}

// MARK: 相关推荐的用户信息模型
struct UserCardUserInfo: HandyJSON {
    
    var name: String = ""
    
    var user_id: Int = 0
    
    var avatar_url: String = ""
    
    var desc: String = ""
    
    var schema: String = ""
    
    var user_auth_info = UserAuthInfo()
}

// MARK: 相关推荐的用户是否关注模型
struct UserCardUserRelation: HandyJSON {
    
    var is_followed: Bool = false
    
    var is_following: Bool = false
    
    var is_friend: Bool = false
    
}

// MARK: 位置
struct DongtaiPosition: HandyJSON {
    
    var position: String = ""
}


struct RepostParam: HandyJSON {
    
    var opt_id: Int = 0
    
    var repost_type: Int = 0
    
    var schema: String = ""
    
    var fw_id_str: String = ""
    
    var opt_id_str: String = ""
    
    var opt_id_type: Int = 0
    
    var fw_id_type: Int = 0
    
    var fw_user_id: Int = 0
    
    var fw_id: Int = 0
    
    var cover_url = ""
    
    var title = ""
}


struct URLList: HandyJSON{
    
    var url : String = ""
}
