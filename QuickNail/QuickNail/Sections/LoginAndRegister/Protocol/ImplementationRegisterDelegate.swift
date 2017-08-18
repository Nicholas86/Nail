//
//  ImplementationRegisterDelegate.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/9.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

#if !RX_NO_MODULE
    import RxSwift
#endif

import struct Foundation.CharacterSet
import struct Foundation.URL
import struct Foundation.URLRequest
import struct Foundation.NSRange
import class Foundation.URLSession
import func Foundation.arc4random
import UIKit


class ImplementationRegisterDelegate: RegisterDelegate {

    
    let URLSession: Foundation.URLSession
    
    static let sharedAPI = ImplementationRegisterDelegate(
        URLSession: Foundation.URLSession.shared
    )

    init(URLSession: Foundation.URLSession) {
        self.URLSession = URLSession
    }

    //实现协议
    func userNameAvailable(userName: String) -> Observable<Bool> {
        
        
        let url = URL(string: "https://github.com/\(userName.URLEscaped)")!
        let request = URLRequest(url: url)
        return self.URLSession.rx.response(request: request)
            .map { (response, _) in
                return response.statusCode == 404
            }
            .catchErrorJustReturn(false)
    }
    
    //注册 网络请求
    func registerUp(userName: String, password: String) -> Observable<Bool> {
        
        return Observable.create({ (observer) -> Disposable in
            
            let paraDic = [
                "usertel":String(userName),
                "pwd":String(password)
                ] as [String : AnyObject]
            
            printLog(message: "参数 ---- \(paraDic)")
            
            let dataTask : URLSessionTask = NetWorkiTools.requestData(method:MethodType.postType, urlString:registerUrl, paraDic: paraDic, successNetWorkingToolsBlock: { (resObject) in
                
                printLog(message: "注册成功了 -- \(resObject)")
                
                var isSuccess = false
                
                if (resObject["ErrorCode"]?.isEqual(to: errorCode))!{
                    isSuccess = true
                }
                
                observer.onNext(isSuccess)
                
                observer.onCompleted()
                
            }) { (error) in
                
                printLog(message: "注册失败了 -- \(error)")
                
                observer.onNext(false)
                
                observer.onCompleted()

            }

            return Disposables.create(with: {
                dataTask.cancel()
            })//释放资源
            
        })
        
        
//        
//        let signupResult = arc4random() % 5 == 0 ? false : true
//        
//        return Observable.just(signupResult)
//            .delay(1.0, scheduler: MainScheduler.instance)

    }
    
    
    //忘记密码 网络请求
    func forgetUp(userName:String,password:String) -> Observable<Bool>{
        
        return Observable.create({ (observer) -> Disposable in
            
            let paraDic = [
                "usertel":String(userName),
                "newpwd":String(password)
                ] as [String : AnyObject]
            
            printLog(message: "参数 ---- \(paraDic)")
            
            let dataTask : URLSessionTask = NetWorkiTools.requestData(method:MethodType.postType, urlString:forgetPasswordUrl, paraDic: paraDic, successNetWorkingToolsBlock: { (resObject) in
                
                printLog(message: "忘记密码成功了 -- \(resObject)")
                
                var isSuccess = false
                
                if (resObject["ErrorCode"]?.isEqual(to: errorCode))!{
                    isSuccess = true
                }
                
                observer.onNext(isSuccess)
                
                observer.onCompleted()
                
            }) { (error) in
                
                printLog(message: "忘记密码失败了 -- \(error)")
                
                observer.onNext(false)
                
                observer.onCompleted()
                
            }
            
            return Disposables.create(with: {
                dataTask.cancel()
            })//释放资源
            
        })
        
    }
    
    
    
}









