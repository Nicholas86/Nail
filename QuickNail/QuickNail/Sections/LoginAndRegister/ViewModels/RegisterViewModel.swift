//
//  RegisterViewModel.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/8.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit
import Foundation

import RxSwift
import RxCocoa

class RegisterViewModel: NSObject {

    //1.手机号
    var validatePhoneNumber : Driver<ValidationResult>!
    
    //2.密码
    var validatePassWord : Driver<ValidationResult>!
    
    //3.确认密码
    var validatedPasswordRepeated : Driver<ValidationResult>!
    
    //4.注册按钮 交互
    var registerEnabled : Driver<Bool>!
    
    //5.注册 --- 成功或失败
    var registerResult : Driver<Bool>!
    
    //6.类型: 注册 忘记密码
    var registerType : RegisterType!
    
    //MARK:自定义初始化
    init(
        input:(
            userName:Driver<String>,
            passWord:Driver<String>,
            repeatPassWord:Driver<String>,
            registerType:RegisterType,
            loginTaps:Driver<Void>
        ),
        dependency:(
            //验证字段是否可用
            validationServiceDelegate:RegisterValidationServiceDelegate,
            //注册
            api:RegisterDelegate,
            wireFrame :Wireframe //线框
        )
        ) {
        
        super.init()
        //验证字段是否可用
        let validationServiceDelegate = dependency.validationServiceDelegate
        //注册
        let api = dependency.api
        let wireFrame = dependency.wireFrame
        
        //类型 : 注册  忘记密码
        registerType = input.registerType
        
        //MARK:对传进来的信号进行处理,并接收
        
        
        //1.用户名  初始化的时候,将 用户名 传进delegate验证,并返回验证结果。
        
        //相当于普通delegate传值时,点击按钮那一步
        /*
        validatePhoneNumber = input.userName.flatMapLatest({ (phoneNumber) in
            return validationServiceDelegate.validateUserName(userName: phoneNumber).asDriver(onErrorJustReturn: ValidationResult.failed(message: "服务器错误"))
        })
        */
        
        validatePhoneNumber = input.userName.map({ (phoneNumber) in
            printLog(message: "接收并返回给控制器 -- \(validationServiceDelegate.validateUserName(userName: phoneNumber))")
            return validationServiceDelegate.validateUserName(userName: phoneNumber)
        })
        
        //2.密码  初始化的时候,将 密码 传进delegate验证,并返回验证结果
        validatePassWord = input.passWord.map({ (password) in
            return validationServiceDelegate.validatePassword(password: password)
        })
        
        //3.验证重复密码 -- 将密码 和 重复密码 一起绑定成一个信号
        validatedPasswordRepeated = Driver.combineLatest(input.passWord,input.repeatPassWord, resultSelector:validationServiceDelegate.validateRepeatedPassword)
        
        
        //5.注册 调接口--- 成功或失败  将用户名 和 密码 一起绑定成一个信号
        let userNameWithPassword = Driver.combineLatest(input.userName,input.passWord) { ($0,$1) }
        
        //DispatchQueue基本用法异步async：在子线程执行耗时操作完成后，将结果刷新到界面
        //创建线程
    let queue = DispatchQueue.init(label: "com.forget")

    queue.async {

        if (self.registerType == RegisterType.registerType) { //注册
            
            self.registerResult = input.loginTaps.withLatestFrom(userNameWithPassword)
                .flatMapLatest({ (userNme,password) in
                    return api.registerUp(userName: userNme, password: password).asDriver(onErrorJustReturn: false)
                }) //信号传递到下面的 flatMapLatest 传进来的 bool 类型,返回bool类型
                .flatMapLatest({ (registerIn) -> Driver<Bool> in
                    let message  = registerIn ? "注册成功" : "注册失败"
                    return wireFrame.promptFor(message, cancelAction: "OK", actions: [])
                        // propagate original value
                        .map { _ in
                            registerIn
                        }
                        .asDriver(onErrorJustReturn: false)
                })

        }else if (self.registerType == RegisterType.forgtetType){//忘记密码
            
            self.registerResult = input.loginTaps.withLatestFrom(userNameWithPassword)
                .flatMapLatest({ (userNme,password) in
                    return api.forgetUp(userName: userNme, password: password).asDriver(onErrorJustReturn: false)
                }) //信号传递到下面的 flatMapLatest 传进来的 bool 类型,返回bool类型
                .flatMapLatest({ (registerIn) -> Driver<Bool> in
                    let message  = registerIn ? "忘记成功" : "忘记失败"
//                    return Observable.just(registerIn)
                    return wireFrame.promptFor(message, cancelAction: "OK", actions: [])
                        // propagate original value
                        .map { _ in
                            registerIn
                        }
                        .asDriver(onErrorJustReturn: false)
                })

        }
        
        
    }
        //4.缓存注册按钮交互
        cacheSignupEnabled()

    }


}



extension RegisterViewModel{
    
    //注册按钮交互  --- 用户名,密码,重复密码,都有效时,打开注册按钮交互
    func cacheSignupEnabled() -> Void {
        
        registerEnabled = Driver.combineLatest(validatePhoneNumber, validatePassWord, validatedPasswordRepeated){ username, password, repeatPassword in
            username.isValid &&
                password.isValid &&
                repeatPassword.isValid
            }.distinctUntilChanged()
        
    }
    
}


