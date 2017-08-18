//
//  NSKeyedArchiverManager.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/27.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class NSKeyedArchiverManager: NSObject {

    //归档到userDefaults
    class func recoderUserInfo() -> Void {
        let data = NSKeyedArchiver.archivedData(withRootObject: userManagerSingleton)
        userDefaults.setValue(data, forKey: LoginUserInfoKey)
        userDefaults.synchronize()
    }

    /// 退出登录,清空归档信息
    class func loginOut() {
        userDefaults.removeObject(forKey: LoginUserInfoKey)
        userDefaults.synchronize()
    }

    
}







