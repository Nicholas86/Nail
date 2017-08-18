//
//  UtilHelpSingleton.swift
//  SportsProduct
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit

class UtilHelpSingleton: NSObject {

    //创建单例
    static let shareUtilHelpSingleton = UtilHelpSingleton()
    
    //私有化初始化
    fileprivate override init() {}
    
    //保存网络状态
    var networkStatus : Bool = true
    
//    //保存登录接口数据
//    func saveLoginDataToLocalFile(loginModel : LoginModel) -> Void {
//        
//        //存储前先移除
//        removeLoginDataFromLocalFile()
//        var userDic = [String : String]()
//        userDic["account"] = String(loginModel.account)
//        userDic["id"] = String(loginModel.id)
//
//        /*
//        if let unwrappedNickName: String = loginModel.nickName  {
//            userDic["nickName"] = unwrappedNickName
//        }else{
//            userDic["nickName"] = "昵称"
//        }
//       */
//        
//        userDic["nickName"] = loginModel.nickName ?? "昵称"
//        
//        /*
//        if let unwrappedRealName: String = loginModel.realName  {
//            userDic["realName"] = unwrappedRealName
//        }else{
//            userDic["realName"] = "姓名"
//        }
//       */
//        userDic["realName"] = loginModel.realName ?? "姓名"
//        
//        /*
//        if let unwrappedHeadRealPath: String = loginModel.headRealPath  {
//            userDic["headRealPath"] = unwrappedHeadRealPath
//        }else{
//            userDic["headRealPath"] = "图像"
//        }
//        */
//        userDic["headRealPath"] = loginModel.headRealPath ?? "图像"
//        
//        /*
//        if let unwrappedBirthday: String = loginModel.birthday  {
//            userDic["birthday"] = unwrappedBirthday
//        }else{
//            userDic["birthday"] = "生日"
//        }
//        */
//        userDic["birthday"] = loginModel.birthday ?? "生日"
//
//        userDefaults.set(userDic, forKey: "Dictionary")
//        userDefaults.synchronize()
//    }
    
   
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
  
    //移除登录数据
    func removeLoginDataFromLocalFile() -> Void {
        userDefaults.removeObject(forKey: "Dictionary")
        userDefaults.synchronize()
    }
    
    
    //返回网络状态
    func returnNetworkStatus() -> Bool {
        return self.networkStatus
    }
    
}



