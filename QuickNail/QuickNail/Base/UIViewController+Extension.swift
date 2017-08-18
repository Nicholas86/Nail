//
//  UIViewController+Extension.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/3.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{

    func addLeftBarMenu(leftMenuButton:UIBarButtonItem?) -> Void {
        //解包
        guard let revealVC = revealViewController(),let leftBtn = leftMenuButton else {
            return
        }
        
        leftBtn.target = revealVC
        leftBtn.action = Selector.toLeft
        
        view.addGestureRecognizer(revealVC.panGestureRecognizer())
    }
    
}



//便于二次登陆
extension UIViewController{
    
    func login() -> Void {
        if userManagerSingleton.userName.isEmpty {
            let loginSB = UIStoryboard.init(name: "LoginAndRegisterStoryboard", bundle: nil)
            let loginNavi = loginSB.instantiateViewController(withIdentifier: "loginAndRegisterNavigationViewController")
            UIApplication.shared.keyWindow?.rootViewController = loginNavi
        }
    }
    
}


//uistoryboard
extension UIViewController {
    
    func viewControllerFromStoryboar(storboordName:String, storboardControllerIdentifier:String) -> UIViewController {
        
        let sb = UIStoryboard(name: storboordName, bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: storboardControllerIdentifier)
        
        return vc
    }
    
}







