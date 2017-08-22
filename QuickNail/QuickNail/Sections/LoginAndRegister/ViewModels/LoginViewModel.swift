//
//  LoginViewModel.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/27.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: NSObject {

    //手机号
    var phoneValid: Observable<Bool>!
    
    var passwordValid: Observable<Bool>!
    
    var loginBtnEnable: Observable<Bool>!
    
    // 登录结果及逻辑
    var loginResult: Observable<Bool>!
    
    
    init(
        
        input:(
            phoneString:Observable<String>,
            passwordString:Observable<String>,
            loginTaps:Observable<Void>
        ),
        dependency:(
            loginServiceDelegate:LoginValidationServiceDelegate,
            api:LoginDelegate
        )
        
        ) {
    
        super.init()
        
        //登录接口
        let loginServiceDelegate = dependency.loginServiceDelegate
        
        let api = dependency.api
        
        //手机号
        phoneValid = input.phoneString.map({ (phoneString) in
            return loginServiceDelegate.validationPhoneNumber(phoneString: phoneString)
        })
        
        //密码
        passwordValid = input.passwordString.map({ (passwordString)in
            return loginServiceDelegate.validationPassword(passwordString: passwordString)
        })
        
        
        //登录结果
        let usernameAndPwd = Observable.combineLatest(input.phoneString, input.passwordString) { ($0, $1) }
        
        
        //DispatchQueue基本用法异步async：在子线程执行耗时操作完成后，将结果刷新到界面
        //创建线程
        let queue = DispatchQueue.init(label: "com.login")
        
        queue.async {
            
            self.loginResult = input.loginTaps.asObservable().withLatestFrom(usernameAndPwd).flatMapLatest({ (phone,password) in
                return api.login(phoneString: phone, passwordString: password)
            }).flatMapLatest({ (registerIn) -> Observable<Bool> in
                let message  = registerIn ? "登录成功" : "登录失败"
                printLog(message: "\(message)")
                return Observable.just(registerIn)
//            return wireFrame.promptFor(message, cancelAction: "OK", actions: [])
//                // propagate original value
//                .map { _ in
//                    registerIn
//                }
//                .asDriver(onErrorJustReturn: false)
            }).shareReplay(1)

        }
        
        //登录按钮是否可用
        loginBtnEnable = Observable.combineLatest(phoneValid, passwordValid) {
            return $0 && $1
        }

    }
    

}








