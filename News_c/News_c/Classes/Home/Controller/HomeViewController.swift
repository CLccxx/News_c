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
        // 首页顶部新闻标题的数据
        NetworkTool.loadHomeNewsTitleData {
            // 向数据库中插入数据 $0表示第一个参数
            NewsTitleTable().insert($0)
            let configuration = SGPageTitleViewConfigure()
            configuration.titleColor = UIColor.black
            configuration.titleSelectedColor = UIColor.globalRedColor()
            configuration.indicatorColor = UIColor.clear
            // 标题名称的数组
            let titleViewRect = CGRect(x: 0, y: 0, width: screenWidth - newsTitleHeight, height: newsTitleHeight)
            self.pageTitleView = SGPageTitleView(frame: titleViewRect, delegate: self, titleNames: $0.flatMap({ $0.name }), configure: configuration)
            self.pageTitleView!.backgroundColor = UIColor.clear
            self.view.addSubview(self.pageTitleView!)
            // 设置子控制器
            $0.flatMap({ (newsTitle) -> () in
                switch newsTitle.category {
                
                // TODO: 添加子控制器
                case .video: // 视频
                    let videoTableVC = VideoTableViewController()
                    videoTableVC.newsTitle = newsTitle
                    videoTableVC.setupRefresh(with: .video)
                    self.addChildViewController(videoTableVC)
                    break
                case .essayJoke: // 段子
                    break
                case .imagePPMM: // 街拍
                    break
                case .imageFunny: // 趣图
                    break
                case .photos: // 图片，组图
                    break
                case .jinritemai: // 特卖
                    break
                default : // 其他
                    
                    break
                }
            })
            
            // 视图内容
            let contentViewRect = CGRect(x: 0, y: newsTitleHeight, width: screenWidth, height: self.view.height - newsTitleHeight)
            self.pageContentView = SGPageContentView(frame: contentViewRect, parentVC: self, childVCs: self.childViewControllers)
            self.pageContentView!.delegatePageContentView = self
            self.view.addSubview(self.pageContentView!)
        }
    }
    
    private func clickAction() {
        
    }
}

// MARK :- SGPageTitleViewDelegate
extension HomeViewController : SGPageTitleViewDelegate, SGPageContentViewDelegate {
    // 联动pageContent的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentView!.setPageCententViewCurrentIndex(selectedIndex)
    }
    
    // 联动SGPageTitleView的方法
    func pageContentView(_ pageContentView: SGPageContentView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.pageTitleView!.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
