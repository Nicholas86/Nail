//
//  ShowProgressHUD.swift
//  TaskElephant
//
//  Created by apple on 17/4/11.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit

import SVProgressHUD

class ShowProgressHUD: NSObject {
    
    class func setupHUD() -> Void{
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setForegroundColor(redColor)
        SVProgressHUD.setBackgroundColor(blackColor)//UIColor(white: 0.0, alpha: 0.8)
        SVProgressHUD.setFont(UIFont.boldSystemFont(ofSize: 16))
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
    }
    
    class func show() {
        SVProgressHUD.show()
    }
    
    class func showWithStatus(status: String) {
        SVProgressHUD.show(withStatus: status)
    }
    
    class func showInfoWithStatus(status: String) {
        SVProgressHUD.showInfo(withStatus: status)
    }
    
    class func showSuccessWithStatus(status: String) {
        SVProgressHUD.showSuccess(withStatus: status)
    }
    
    class func showErrorWithStatus(status: String) {
        SVProgressHUD.showError(withStatus: status)
    }
    
    class func dismiss() {
        SVProgressHUD.dismiss()
    }

}






