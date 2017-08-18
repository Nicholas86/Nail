//
//  ImplementLoginServiceDelegate.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/11.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class ImplementLoginServiceDelegate: LoginValidationServiceDelegate {

    //单例初始化
    static let sharedLoginService = ImplementLoginServiceDelegate()
    
    //私有化初始化
    init() {}
    
    // validation
    
    let minPasswordCount = 6

    //实现手机号验证
    func validationPhoneNumber(phoneString: String) -> Bool {
    
        if phoneString.characters.count == 0{
            return false
        }
        
        if !String.isValidmobile(phoneString) {
            return false
        }
        
        if phoneString.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
            return false
        }
        
        return true
    }
    
    //实现 验证密码
    func validationPassword(passwordString: String) -> Bool {
        
        if passwordString.characters.count == 0 {
            return false
        }
        
        if passwordString.characters.count < minPasswordCount {
            return false
        }
    
        return true
    }
    
    
}





