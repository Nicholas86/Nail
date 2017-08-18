//
//  LoginProtocol.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/11.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

//1.订立协议  -- 验证字段有效
protocol LoginValidationServiceDelegate{
    //验证手机号
    func validationPhoneNumber(phoneString:String) -> Bool
    //验证密码
    func validationPassword(passwordString:String) -> Bool
}


//2.订立协议  -- 调接口
protocol LoginDelegate{
    //调接口
    func login(phoneString:String,passwordString:String) -> Observable<Bool>
}




