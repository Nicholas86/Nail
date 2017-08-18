//
//  ShowMBProgressHUD.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/28.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class ShowMBProgressHUD: NSObject {

    //封住成class方法
    class func showAndDelayHideMBProgressHUD(view: UIView, titleString: String, delay: TimeInterval) {
        
        let smBProgressHUD = SMBProgressHUD.share
        smBProgressHUD.showMBProgressAndDelayHideMBProgressHUD(view: view, title: titleString, delay: delay)
        
    }
    
    
}
