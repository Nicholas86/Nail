//
//  ToolsMacros.swift
//  SportsProduct
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 xiangguohe. All rights reserved.
//

import UIKit
/// 输出日志
/// - parameter message:  日志消息
/// - parameter logError: 错误标记，默认是false,如果是true,发布时仍然会输出
/// - parameter file:     文件名
/// - parameter method:   方法名
/// - parameter line:     代码行数
// 这里 T 表示不指定 message参数类型
func printLog<T>(message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        // 需要在 buildSetting 中配置 swift flags的参数为:-D DEBUG, DEBUG可以自定义, 一般用 DEBUG
        // 搜 swift flags-->other swift flags-->DEBUG-->点+号-->输入上面的配置参数
        // 上传AppStore时,将buildSetting中-D DEBUG删除即可
        // 1.对文件进行处理
        let fileName = (file as NSString).lastPathComponent
        
        // 2.打印内容
        print("上传AppStore时,将buildSetting中-D DEBUG删除即可 [\(fileName)][\(funcName)](\(lineNum)):\(message)")
    #endif
}


