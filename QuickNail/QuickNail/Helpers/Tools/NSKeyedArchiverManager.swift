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
    static func recoderUserInfo() -> Void {
        let data = NSKeyedArchiver.archivedData(withRootObject: userManagerSingleton)
        userDefaults.setValue(data, forKey: LoginUserInfoKey)
        userDefaults.synchronize()
    }

    /// 退出登录,清空归档信息
    static func loginOut() {
        userDefaults.removeObject(forKey: LoginUserInfoKey)
        userDefaults.synchronize()
    }

    //归档定位城市
    static func recorderLocationString() ->Void {
        let data = NSKeyedArchiver.archivedData(withRootObject: utilHelpSingleton)
        userDefaults.setValue(data, forKey: LocationCityString)
        userDefaults.synchronize()
    }
    
    
}







