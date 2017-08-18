//
//  RegisterProtocol.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/8.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

//import Foundation
import RxSwift
import RxCocoa


//1.验证结果枚举
enum ValidationResult {
    case ok(message:String)
    case empty
    case validating
    case failed(message:String)
}

//2.注册状态枚举
enum RegisterState{
    case registerState(registerUp:Bool)
}


//3.注册验证服务
protocol RegisterValidationServiceDelegate{
    /*
     //验证用户名
     func validateUserName(userName:String) -> Observable<ValidationResult>
     */

    //验证用户名
    func validateUserName(userName:String) -> ValidationResult
    //验证密码
    func validatePassword(password:String) -> ValidationResult
    //验证重复密码
    func validateRepeatedPassword(password:String,repeatedPassword:String) -> ValidationResult
}

//4.注册、忘记密码 协议
protocol RegisterDelegate {
    //订立 用户名协议 -- 返回bool信号
    func userNameAvailable(userName:String) -> Observable<Bool>
    //订立 注册 用户名,密码协议 -- 返回bool信号
    func registerUp(userName:String,password:String) -> Observable<Bool>
    //订立 忘记密码 用户名,密码协议 -- 返回bool信号
    func forgetUp(userName:String,password:String) -> Observable<Bool>
}


//5.扩展验证结果
extension ValidationResult {
    
    var isValid : Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
    
}



