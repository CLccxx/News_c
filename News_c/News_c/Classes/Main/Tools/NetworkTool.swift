//
//  NetworkTool.swift
//  News_c
//
//  Created by 杨博兴 on 2018/3/1.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
    // MARK: ---- 首页 home -----
    // MARK: 首页顶部新闻标题的数据
    static func loadHomeNewsTitleData(completionHandler: @escaping (_ newsTitles : [HomeNewsTitle]) -> ())
    
    // MARK: 首页顶部导航栏搜索推荐标题内容
    static func loadHomeSearchSuggestInfo(_ completionHandler : @escaping (_ searchSuggest : String) -> ())
}

extension NetworkToolProtocol {
    // MARK :- 首页顶部新闻标题的数据
    // - parameter completionHandler: 返回标题数据
    // - parameter newsTitles: 首页标题数据
    static func loadHomeNewsTitleData(completionHandler: @escaping (_ newsTitles : [HomeNewsTitle]) -> ()) {
        let url = BASE_URL + "/article/category/get_subscribed/v1/?"
        let params = ["device_id": device_id, "iid": iid];
        AlamofireHelpTool.getJSONDataDictWith(url: url, parameters: params) { (dataDict) in
            if let datas = dataDict["data"]?.arrayObject{
                var titles = [HomeNewsTitle]()
                titles.append(HomeNewsTitle.deserialize(from: "{\"category\": \"\", \"name\": \"推荐\"}")!)
                titles += datas.flatMap({ HomeNewsTitle.deserialize(from: $0 as? Dictionary) })
                completionHandler(titles)
            }
        }
    }
    
    // MARK: 首页顶部导航栏搜索推荐标题内容
    // - parameter completionHandler : 返回搜索建议数据回调
    // - parameter searchSuggest : 首页搜索建议
    static func loadHomeSearchSuggestInfo(_ completionHandler : @escaping (_ searchSuggest : String) -> ()) {
        let url = BASE_URL + "/search/suggest/homepage_suggest/?"
        let params = ["device_id" : device_id, "iid" : iid]
        
        AlamofireHelpTool.getJSONDataDictWith(url: url, parameters: params) { (dataDict) in
            completionHandler(dataDict["homepage_search_suggest"]!.string!)
        }
    }
}

struct NetworkTool : NetworkToolProtocol { }

// 获取到JSONDataDict的封装
// 拿到数据之后各自进行处理
class AlamofireHelpTool {
    
    public class func getJSONDataDictWith(url : String , parameters : [String : Any] , _ completionHandler : @escaping (_ data : [String : JSON]) ->()) -> Void {
        
        Alamofire.request(url, parameters : parameters).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else { return }
                if let dataDict = json["data"].dictionary {
                    completionHandler(dataDict)
                }
            }
        }
    }
}


