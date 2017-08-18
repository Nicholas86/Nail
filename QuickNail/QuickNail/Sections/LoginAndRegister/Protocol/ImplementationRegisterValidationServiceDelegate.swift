//
//  ImplementationRegisterValidationServiceDelegate.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/9.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import RxSwift

import struct Foundation.CharacterSet
import struct Foundation.URL
import struct Foundation.URLRequest
import struct Foundation.NSRange
import class Foundation.URLSession
import func Foundation.arc4random
import UIKit

class ImplementationRegisterValidationServiceDelegate: RegisterValidationServiceDelegate {

    let api: RegisterDelegate
    
    //单例初始化
    static let sharedValidationService = ImplementationRegisterValidationServiceDelegate(api: ImplementationRegisterDelegate.sharedAPI)
    
    //上面单例,初始化调下面的init,同时初始化RegisterDelegate ---- 二次 初始化
    init (api: RegisterDelegate) {
        self.api = api
    }
    
    // validation
    
    let minPasswordCount = 6

    //用户名协议
    func validateUserName(userName: String) -> ValidationResult{
        
        if userName.characters.count == 0{
            return (.empty)
        }
        
        if !String.isValidmobile(userName) {
            return .failed(message: "手机号不合法\(userName)")
        }
        
        if userName.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
            return (.failed(message: "用户名只能包含 数字和 字符"))
        }
        
        return ValidationResult.ok(message: "用户名可用\(userName)")
    }
    
    
    /*
    //用户名协议
    func validateUserName(userName: String) -> Observable<ValidationResult> {
        
        printLog(message: "验证 - 用户名\(userName)")
        
        if userName.characters.count == 0{
            printLog(message: "用户名为空")
            return .just(.empty)
        }
        
        if userName.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
            printLog(message: "用户名只能包含 数字和 字符")
            return .just(.failed(message: "Username can only contain numbers or digits"))
        }
        
        //定义 并初始化 枚举 类型
        let loadingValue = ValidationResult.validating
        
        return api.userNameAvailable(userName: userName)
            .map({ (available) in
                
                if available {
                    printLog(message: "用户名可用")
                    return ValidationResult.ok(message: "用户名可用")
                }else{
                    printLog(message: "用户名不可用")
                    return ValidationResult.failed(message: "用户名不可用")
                }
                
            })
            .startWith(loadingValue)
        
    }
   */
    
    //密码协议
    func validatePassword(password: String) -> ValidationResult {
        
        let numberOfCharacters = password.characters.count
        
        if numberOfCharacters == 0 {
            return .empty
        }
        
        if numberOfCharacters < minPasswordCount {
            return .failed(message: "密码必须 \(minPasswordCount) 个 字符")
        }
        
        return .ok(message: "密码可用")
    }
    
    
    //重复密码
    func validateRepeatedPassword(password: String, repeatedPassword: String) -> ValidationResult {
        
        if repeatedPassword.characters.count == 0 {
            return .empty
        }
        
        if repeatedPassword == password {
            return .ok(message: "密码一致")
        }else {
            return .failed(message: "密码不同")
        }
        
    }
    
    
}



