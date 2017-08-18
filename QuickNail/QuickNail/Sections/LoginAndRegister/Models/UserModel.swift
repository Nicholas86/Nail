//
//  UserModel.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/27.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation

//(84):.post 封装网络请求 成功 result {
//    Content =     (
//        {
//            companyid = "<null>";
//            id = 6;
//            phonecode = "<null>";
//            picpwd = "<null>";
//            pwd = 123456;
//            regtime = "2017-08-11 11:00:56";
//            sex = "<null>";
//            username = "<null>";
//            usertel = 18272733612;
//        }
//    );
//    ErrorCode = 0000;
//    ErrorContent = success;
//}

class UserModel: BaseModel {

     var companyid : String?
    
     var cid : String?
    
     var phonecode : String?

     var pwd : String?
    
     var sex : String?
    
     var username : String?
    
     var usertel : String?
    
    //重建映射关系
    override func attributesDic(dic: [String : AnyObject]) -> [String : AnyObject] {
    
        var newDic : [String : AnyObject] = super.attributesDic(dic: dic)
        
        newDic["cid"] = "id" as AnyObject
        
        return newDic
    }
    
    
    
    
//    init(resultDic : [String : AnyObject]) {
//        super.init()
//        setValuesForKeys(resultDic)
//    }
    
    
    /*
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
     */
    
//    override func setValue(_ value: Any?, forKey key: String) {
//    
//        printLog(message: "value  === \(String(describing: value))")
//        super.setValue(value, forKey: key)
//        if (key == "usertel"){
//            self.setValue(String(describing: usertel), forKey: "usertel")
//        }
//        
//    }
    
    
}







