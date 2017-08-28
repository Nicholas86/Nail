//
//  NetWorkiTools.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/11.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

//成功
typealias SuccessNetWorkingToolsBlock = ([String:AnyObject]) ->Void

//失败
typealias FailueNetWorkingToolsBlock = (NSError) ->Void


class NetWorkiTools: NSObject {

    static let shareNetWorkiTools = NetWorkiTools()
    
    fileprivate override init() {}
    
    
    class func requestData(method:MethodType,urlString:String,paraDic:[String:AnyObject],successNetWorkingToolsBlock:@escaping SuccessNetWorkingToolsBlock,failueNetWorkingToolsBlock:@escaping FailueNetWorkingToolsBlock) -> URLSessionTask {
        
        let quilkNail = QuilkNailNetWorkTools.shareQuilkNailNetWorkTools
        
        if (method == MethodType.getType) {
            let dataTask : URLSessionTask = quilkNail.request(methodType: method, urlString: urlString, paraDic: paraDic, successQuickBlock: { (responseObject) in
                
                printLog(message: "成功")
                successNetWorkingToolsBlock(responseObject)

            }) { (error) in
                printLog(message: "\(error)")
                failueNetWorkingToolsBlock(error)
            }
            return dataTask
        }else if (method == MethodType.postType){
            
            let dataTask : URLSessionTask = quilkNail.request(methodType: method, urlString: urlString, paraDic: paraDic, successQuickBlock: { (responseObject) in
                
                printLog(message: "post 成功responseObject == \(responseObject)")
                successNetWorkingToolsBlock(responseObject)
            }) { (error) in
                printLog(message: "失败\(error)")
                failueNetWorkingToolsBlock(error)
            }
             return dataTask
        }else{
            
            let dataTask : URLSessionTask = quilkNail.request(methodType: method, urlString: urlString, paraDic: paraDic, successQuickBlock: { (responseObject) in
                
                printLog(message: "成功")
                successNetWorkingToolsBlock(responseObject)

            }) { (error) in
                printLog(message: "\(error)")
                failueNetWorkingToolsBlock(error)

            }
            return dataTask
        }
        
        
    }
    
    
}
