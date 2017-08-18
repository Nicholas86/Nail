//
//  String+Extension.swift
//  SportsProduct
//
//  Created by apple on 16/10/26.
//  Copyright © 2016年 xiangguohe. All rights reserved.
//

import UIKit

public extension String{
    
    /// 判断手机号是否合法
    static func isValidmobile(_ string: String) -> Bool {
        // 判断是否是手机号
        let patternString = "^1[3|4|5|7|8][0-9]\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluate(with: string)
    }
    
    /// 判断密码是否合法
    static func isValidPasswod(_ string: String) -> Bool {
        // 验证密码是 6 - 16 位字母或数字
        let patternString = "^[0-9A-Za-z]{6,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluate(with: string)
    }
    
    ///字符串转格式
    static func dateToDateString(date : Date) -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        return dateFormatter.string(from: date)
    }
    
    ///字符串转格式
    static func dateToBirthDateString(date : Date) -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: date)
    }

    
    ///计算时间时间间隔
    static func computingTimeInterval(startTime : String,endString : String) -> Bool{
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        let startDate = dateFormatter.date(from: startTime)
        let endDate = dateFormatter.date(from: endString)
        let timeInterval = endDate!.timeIntervalSince(startDate!)
        return timeInterval < 0 ? false : true
    }
    

    var URLEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
}

// MARK: - 通过扩展来简化一下,截取字符串

extension String {
    
    subscript (range: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            return self[Range(startIndex..<endIndex)]
        }
        
        set {
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            let strRange = Range(startIndex..<endIndex)
            self.replaceSubrange(strRange, with: newValue)
        }
    }
    
}


extension String {
    
    func subString(from: Int) -> String {
        let end = self.characters.count
        return self[from..<end]
    }
    
    
    func subString(from: Int, length: Int) -> String {
        let end = from + length
        return self[from..<end]
    }
    
    
    func subString(from:Int, to:Int) ->String {
        return self[from..<to]
    }

}

