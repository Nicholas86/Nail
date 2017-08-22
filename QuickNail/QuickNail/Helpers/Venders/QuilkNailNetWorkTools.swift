//
//  QuilkNailNetWorkTools.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/11.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum MethodType : Int {
    case getType     = 0
    case postType    = 1
    case deleteType  = 2
}

//成功回调
typealias SuccessQuickBlock = ([String : AnyObject]) -> Void

//失败回调
typealias FailueQuickBlock = (NSError) -> Void


class QuilkNailNetWorkTools: NSObject {

    //1.创建单例
    static let shareQuilkNailNetWorkTools = QuilkNailNetWorkTools()
    
    //2.私有化初始化
    fileprivate override init() {}

    //3.封装网络请求
    
    func request(methodType:MethodType,urlString:String,paraDic:[String : AnyObject],successQuickBlock : @escaping SuccessQuickBlock,failueQuickBlock:@escaping FailueQuickBlock) -> URLSessionTask {
        
        printLog(message: " 哈哈 -- \(paraDic) \(methodType) \(urlString)")

        
        if methodType == MethodType.getType{
            
            let requestData = Alamofire.request(urlString, method: .get, parameters: paraDic).responseJSON(completionHandler: { (response) in
                
                // 请求成功
                if response.result.isSuccess {
                
                    guard let result = response.result.value  else{
                        return
                    }
                
                    let json = JSON(result)
                
                    //将结果blcok出去
                    if let jsonObject: AnyObject = json.dictionary as AnyObject {
                        //SVProgressHUD.showError(withStatus: "加载失败...")
                        successQuickBlock(jsonObject as! [String : AnyObject])
                    }
                    
                }else { //失败
                    
                    failueQuickBlock(response.result.error! as NSError)
                }
                
            })
            
            return requestData.task!
            
        }else if (methodType == MethodType.postType){
            
            let requestData = Alamofire.request(urlString, method: .post, parameters: paraDic).responseJSON(completionHandler: { (response) in
                
                // 请求成功
                if response.result.isSuccess {
                    
                    guard let result = response.result.value  else{
                        return
                    }
                    
                    let json = JSON(result)
                    
                    //将结果blcok出去
                    successQuickBlock(json.rawValue as! [String : AnyObject])

                    /*
                    if let jsonObject: AnyObject = json.rawValue as? AnyObject{
                        //SVProgressHUD.showError(withStatus: "加载失败...")
                        successQuickBlock(jsonObject as! [String : AnyObject])
                    }
                    */
                }else if (response.result.isFailure){ //失败
                    
                    failueQuickBlock(response.result.error! as NSError)
                }
                
            })
            
            return requestData.task!
            
        }else{ //删除
            let dataRequest : DataRequest = Alamofire.request(urlString, method: .delete, parameters: paraDic).responseJSON(completionHandler: { (response) in
                
            })
            return dataRequest.task!
        }
    
    }
    
}







