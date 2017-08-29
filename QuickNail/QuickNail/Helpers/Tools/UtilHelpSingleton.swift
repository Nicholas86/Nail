//
//  UtilHelpSingleton.swift
//  SportsProduct
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit

class UtilHelpSingleton: NSObject,NSCoding {

    //城市
    public var cityString : String = ""
    
    //创建单例
    private static  var instance : UtilHelpSingleton! = nil
    
    static func shareUtilHelpSingleton() -> UtilHelpSingleton {
        
        if instance == nil {
            //第一次启动时,先走解归档,为userId,userName赋值
            let obj = getInstanceFromLocation()
            instance = obj ?? UtilHelpSingleton()
        }
        
        return instance
    }
    
    //私有初始化
    private override init() {}
    
    
    //解档
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.cityString = aDecoder.decodeObject(forKey: "cityString") as! String
    }
    
    /// 归档
    ///
    /// - Parameter aCoder: <#aCoder description#>
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.cityString, forKey: "cityString")
        
    }

    
    //保存网络状态
    var networkStatus : Bool = true
    

   
    /*
    //取出登录接口数据
    func getLoginDataFromLocalFile() -> [String : String] {
        
        let userDic : AnyObject? = userDefaults.dictionary(forKey: "Dictionary") as AnyObject?
        if let userdic : [String : AnyObject] = userDic as! Dictionary? {
             return userdic as! [String : String]
        }else{
            var userNoDic = [String : String]()
            userNoDic["id"] = String("n")
             return userNoDic
        }
        
    }
  */
  
    
    //返回网络状态
    func returnNetworkStatus() -> Bool {
        return self.networkStatus
    }
    
}

extension   UtilHelpSingleton {
    
    /// 从UserDefault中进行解归档
    ///
    /// - Returns: <#return value description#>
    static func getInstanceFromLocation() -> UtilHelpSingleton? {
        
        guard let data = userDefaults.value(forKey: LocationCityString) as? Data else {
            return nil
        }
        
        guard let instance = NSKeyedUnarchiver.unarchiveObject(with: data) as? UtilHelpSingleton else {
            return nil
        }
        
        return instance
    }
    
}



