//
//  MyNavigationController.swift
//  News_c
//
//  Created by 杨博兴 on 2018/2/28.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit
import SwiftTheme

class MyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = UINavigationBar.appearance()
        navigationBar.theme_tintColor = "colors.black"
        navigationBar.setBackgroundImage(UIImage.init(named: "navigation_background" + (UserDefaults.standard.bool(forKey: isNight) ? "_night" : "")), for: UIBarMetrics.default)
        
        // 添加通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue : "dayOrNightButtonClicked"), object: nil)
        
    }
    
    @objc func receiveDayOrNightButtonClicked(notification : NSNotification) {
        // 设置为夜间/日间
        navigationBar.setBackgroundImage(UIImage.init(named: "navigation_background" + (notification.object as! Bool ? "_night" : "")), for: UIBarMetrics.default)
        
    }
    
    // 拦截 push 操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            // 通知设置push进界面之后的nav的左边按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "lefterbackicon_titlebar_24x24_"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    // 返回上一控制器
    @objc func navigationBack() -> Void {
        popViewController(animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
