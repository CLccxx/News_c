//
//  MyTabBarController.swift
//  News_c
//
//  Created by 杨博兴 on 2018/2/28.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        1、控件遵守了UIAppearance协议，才能对控件进行appearance设置
//        2、只有被UI_APPEARANCE_SELECTOR这个宏修饰的属性才能使用appearance进行设置，其他属性则不具备该功能
//        3、appearance设置需要在该控制显示之前设置完成，否则可能无效
        
        let tabbar = UITabBar.appearance() // 拿到appearance对象进行统一设置
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"
        
        // 添加子控制器
        addChildViewController()
        // 添加日夜间切换通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
        
    }

    // 接受到日夜间切换按钮点击通知
    @objc private func receiveDayOrNightButtonClicked(notification: NSNotification) -> Void {
        let selector = notification.object as! Bool
        if selector { // 设置为夜间模式
            for childController in childViewControllers {
                switch childController.title! {
                case "首页" :
                    setNightChildController(controller: childController, imageName: "home")
                case "西瓜视频" :
                    setNightChildController(controller: childController, imageName: "video")
                case "小视频" :
                    setNightChildController(controller: childController, imageName: "huoshan")
                case "微头条" :
                    setNightChildController(controller: childController, imageName: "weitoutiao")
                case "" :
                    setNightChildController(controller: childController, imageName: "redpackage")
                    
                default:
                    break
                }
                
            }
        }else {
            for childController in childViewControllers {
                switch childController.title! {
                case "首页" :
                    setDayChildController(controller: childController, imageName: "home")
                case "西瓜视频" :
                    setDayChildController(controller: childController, imageName: "video")
                case "小视频" :
                    setDayChildController(controller: childController, imageName: "huoshan")
                case "微头条" :
                    setDayChildController(controller: childController, imageName: "weitoutiao")
                case "" :
                    setDayChildController(controller: childController, imageName: "redpackage")
                    
                default:
                    break
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension MyTabBarController {
    // 添加子控制器
    private func addChildViewController() -> Void {
        // 这里利用图片的差异将中间凸显出来，图片大小相同但是其他四个图片图标较小，周边空白较大
        setChildViewController(HomeViewController(), title: "首页", imageName: "home")
        setChildViewController(VideoViewController(), title: "西瓜视频", imageName: "video")
        setChildViewController(RedPackageViewController(), title: "", imageName: "redpackage")
        setChildViewController(WeitoutiaoViewController(), title: "微头条", imageName: "weitoutiao")
        setChildViewController(HuoshanViewController(), title: "小视频", imageName: "huoshan")
        // tabBar 是 readonly属性，不能直接修改，利用KVC 将readonly属性修改过来
//        setValue(MyTabBar(), forKey: "tabBar")
        
    }
    
    // 设置子控制器
    private func setChildViewController(_ childController : UIViewController ,title: String , imageName : String) -> Void {
        // 设置tabbar 文字和图片 查看本地保存的日间或夜间模式
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childController, imageName: imageName)
        }else{
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        // 添加导航控制器为 TabBarController的子控制器
        let navVc = MyNavigationController(rootViewController: childController)
        self.addChildViewController(navVc)
    }
    
    // 设置夜间控制器
    private func setNightChildController(controller : UIViewController , imageName : String) -> Void {
        controller.tabBarItem.image = UIImage.init(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage.init(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    // 设置日间控制器
    private func setDayChildController(controller : UIViewController , imageName : String) -> Void {
        controller.tabBarItem.image = UIImage.init(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage.init(named: imageName + "_tabbar_press_32x32_")
    }
    
}
