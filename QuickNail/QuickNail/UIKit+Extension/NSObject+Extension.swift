//
//  NSObject+Extension.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/28.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation

//MARK:Runtime
extension NSObject {
    
     class func setAttribut(dic: [String:AnyObject]) -> Void {
        
        let attributDic = attributesDic(dic: dic)
        //Runtime获取本类属性
        var count:UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder(), &count)
        for i in 0..<count {
            //取出属性名
            let ivar = ivars?[Int(i)]
            let ivarName = ivar_getName(ivar!)
            let nName = String(cString: ivarName!)
            //取出要赋值的值
            let attribut = attributDic[nName] ?? "" as AnyObject
            let value : NSObject = dic[attribut as! String] as? NSObject ?? "" as NSObject
            //利用KVC给本类的属性赋值
            self.setValue(value, forKey: nName)
        }
        
    }
    
    //如果属性名与服务端数据字典key值不对应,那么在子类model中复写此方法,将属性名作为key,字典key值作为value
    
   class func attributesDic(dic:[String : AnyObject]) -> [String : AnyObject] {
    
        var newDic : [String : String] = [:]
        
        for key in dic.keys {
            //复写时注意将属性名作为key 数据字典的key作为value
            newDic[key] = key
        }
        return  newDic as [String : AnyObject]
    }
    
}


// MARK: - 弹框
extension NSObject {
    /// 只有是控制器和继承UIView的控件才会弹框
    /**
     * - 弹框提示
     * - @param info 要提醒的内容
     */
    func showInfo(info: String) {
        if self.isKind(of: UIViewController.self) || self.isKind(of: UIView.self) {
            let alertVc = UIAlertController(title: info, message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "好的", style: .cancel, handler: nil)
            alertVc.addAction(cancelAction)
            UIApplication.shared.keyWindow?.rootViewController?.present(alertVc, animated: true, completion: nil)
        }
    }
    
    static func showInfo(info: String) {
        if self.isKind(of: UIViewController.self) || self.isKind(of: UIView.self) {
            let alertVc = UIAlertController(title: info, message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "好的", style: .cancel, handler: nil)
            alertVc.addAction(cancelAction)
            UIApplication.shared.keyWindow?.rootViewController?.present(alertVc, animated: true, completion: nil)
        }
    }
}




