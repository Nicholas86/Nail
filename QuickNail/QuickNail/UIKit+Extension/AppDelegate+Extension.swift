//
//  AppDelegate+Extension.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/2.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation
import UIKit

//便于二次登陆
extension AppDelegate{
    
    func login() -> Void {
        if userManagerSingleton.usertel.isEmpty {
            let loginSB = UIStoryboard.init(name: "LoginAndRegisterStoryboard", bundle: nil)
            let loginNavi = loginSB.instantiateViewController(withIdentifier: "loginAndRegisterNavigationViewController")
            self.window?.rootViewController = loginNavi
        }
    }
    
}

//配置全局样式
extension AppDelegate {
    
     func setupGlobalStyle() {
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        ShowProgressHUD.setupHUD() // 配置HUD
    }
    
}


extension AppDelegate {
    
    func rectStatusHeight() -> Void {
        // 状态栏(statusbar)
        let rectStatus = UIApplication.shared.statusBarFrame
        KStatusBarHeight = Double(rectStatus.size.height)
//        printLog(message: "导航栏nav height  高度- \(String(describing: KStatusBarHeight))")
    }
    
}


