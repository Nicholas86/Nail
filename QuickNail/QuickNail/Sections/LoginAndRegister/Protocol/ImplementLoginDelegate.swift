//
//  ImplementLoginDelegate.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/11.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

#if !RX_NO_MODULE
    import RxSwift
#endif

class ImplementLoginDelegate: LoginDelegate {

    
    static let sharedImplementLoginDelegate = ImplementLoginDelegate()
    
    init() {}

    //实现登录协议
    
    func login(phoneString: String, passwordString: String) -> Observable<Bool> {
        
        return Observable.create({ (observer) -> Disposable in
            
            let paraDic = [
                "usertel":String(phoneString),
                "pwd":String(passwordString)
                ] as [String : AnyObject]
            
            let dataTask : URLSessionTask = NetWorkiTools.requestData(method:MethodType.postType, urlString:loginUrl, paraDic: paraDic, successNetWorkingToolsBlock: { (resObject) in
                
                printLog(message: "登录成功了 -- \(resObject)")
                
                var isSuccess = false
                
                if (resObject["ErrorCode"]?.isEqual(to: errorCode))!{
                    //登录网络请求后,封装登录userModel数据,保存userModel数据到UserManagerSingleton中
                    let content : Array = resObject["Content"] as! [AnyObject]

                    for paraDic in content{

                        let userModel = UserModel.init(resultDic: paraDic as! [String : AnyObject])

                        userManagerSingleton.userId = userModel.cid ?? ""
                        userManagerSingleton.userName = userModel.username ?? ""
                        userManagerSingleton.usertel = userModel.usertel ?? ""
                        
                    }
                    
                    //将单例归档到UserDefault中,便于二次登录
                    NSKeyedArchiverManager.recoderUserInfo()
                
                }
                
                isSuccess = true
                
                observer.onNext(isSuccess)
                
                observer.onCompleted()
                
            }) { (error) in
                
                observer.onNext(false)
                
                observer.onCompleted()
                
            }
            
            return Disposables.create(with: {
                dataTask.cancel()
            })//释放资源
            
        })
    
    }
    
    
}





