//
//  UserManangerSingleton.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/27.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

//保存全局信息 --NSCoding遵循NSCoding协议
class UserManangerSingleton: NSObject,NSCoding {

    //MARK:登录用户信息
    public  var userId : String = ""
    
    public  var userName : String = ""
    
    public  var usertel : String = ""
    
    //创建单例
    private static  var instance : UserManangerSingleton! = nil
    
    static func share() -> UserManangerSingleton {
        
        if instance == nil {
            //第一次启动时,先走解归档,为userId,userName赋值
            let obj = getInstanceFromLocation()
            instance = obj ?? UserManangerSingleton()
        }
        
        return instance
    }
    
    //私有初始化
    private override init() {}
    
    
    //解档
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.userId = aDecoder.decodeObject(forKey: "userId") as! String
        self.userName = aDecoder.decodeObject(forKey: "userName") as! String
        self.usertel = aDecoder.decodeObject(forKey: "usertel") as! String
    }
    
    /// 归档
    ///
    /// - Parameter aCoder: <#aCoder description#>
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.userId, forKey: "userId")
        
        aCoder.encode(self.userName, forKey: "userName")
        
        aCoder.encode(self.usertel, forKey: "usertel")

    }

}

extension   UserManangerSingleton {
    
    /// 从UserDefault中进行解归档
    ///
    /// - Returns: <#return value description#>
    static func getInstanceFromLocation() -> UserManangerSingleton? {
        
        guard let data = userDefaults.value(forKey: LoginUserInfoKey) as? Data else {
            return nil
        }
        
        guard let instance = NSKeyedUnarchiver.unarchiveObject(with: data) as? UserManangerSingleton else {
            return nil
        }
        
        return instance
    }

}



