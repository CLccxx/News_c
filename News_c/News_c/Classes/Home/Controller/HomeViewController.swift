//
//  HomeViewController.swift
//  News_c
//
//  Created by 杨博兴 on 2018/2/28.
//  Copyright © 2018年 xx_cc. All rights reserved.
//

import UIKit
import SGPagingView
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    // disposeBag
    private lazy var disposeBag = DisposeBag()
    
    // 标题和内容
    private var pageTitleView : SGPageTitleView?
    private var pageContentView : SGPageContentView?
    
    // 从xib加载自定义导航栏
    private lazy var navigationBar = HomeNavigationView.loadViewFromNib()
    
    // 添加频道按钮
    private lazy var addChannelButton : UIButton = {
        let addChannelButton = UIButton(frame: CGRect(x: screenWidth - newsTitleHeight, y: 0, width: newsTitleHeight, height: newsTitleHeight))
        addChannelButton.theme_setImage("images.add_channel_titlbar_thin_new_16x16_", forState: .normal)
        
        let separatorView = UIView(frame: CGRect(x: 0, y: newsTitleHeight - 1, width: newsTitleHeight, height: newsTitleHeight))
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        addChannelButton.addSubview(separatorView)
        
        return addChannelButton
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.keyWindow?.theme_backgroundColor = "colors.windowColor"
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: animated)
    navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "navigation_background" + imageFooter), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
        // 点击事件
        clickAction()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

// MARK :- 导航栏按钮点击
extension HomeViewController {
    // 设置UI
    private func setupUI() {
        view.theme_backgroundColor = "colors.cellBackgroundColor"
        // 设置自定义导航栏
        navigationItem.titleView = navigationBar
        // 添加频道
        view.addSubview(addChannelButton)
        
    }
    
    private func clickAction() {
        
    }
}

