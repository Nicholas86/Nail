//
//  BaseModel.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/17.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
    //自定义构造方法
    init(resultDic: [String:AnyObject]) {
        super.init()
        setAttribut(dic: resultDic)
    }
    
    
    /*
     
     func setAttribut(dic: [String:Any]) -> Void {
     let attributDic = attributesDic(dic: dic)
     
     //Runtime获取本类属性
     var count:UInt32 = 0
     let ivars = class_copyIvarList(self.classForCoder, &count)
     for i in 0..<count {
     //取出属性名
     let ivar = ivars?[Int(i)]
     let ivarName = ivar_getName(ivar!)
     let nName = String(cString: ivarName!)
     //取出要赋值的值
     var attribut = attributDic[nName]
     if attribut == nil{
     attribut = ""
     }
     var value:NSObject
     if dic[attribut!] != nil {
     value = dic[attribut!] as! NSObject
     } else {
     value = "" as NSObject
     }
     
     //利用KVC给本类的属性赋值
     self.setValue(value, forKey: nName)
     
     }
     
     */
    
    //如果属性名与服务端数据字典key值不对应,那么在子类model中复写此方法,将属性名作为key,字典key值作为value
    
    
    func setAttribut(dic: [String:AnyObject]) -> Void {
        
        let attributDic = attributesDic(dic: dic)
        
        //Runtime获取本类属性
        var count:UInt32 = 0
        
        let ivars = class_copyIvarList(self.classForCoder, &count)
        
        for i in 0..<count {
            
            //取出属性名
            let ivar = ivars?[Int(i)]
            
            let ivarName = ivar_getName(ivar!)
            
            let nName = String(cString: ivarName!)
            
            //取出要赋值的key companyid
            let attribut = attributDic[nName] as? String
            
            var key : String = ""
            
            if let attriKey : String = attribut {
                
                key = attriKey
            }
           

            //取出服务端传进来的 value
            var setValue : NSObject
            
            //let keyValue = dic[key] as? String
            
            if let keyValue : String = (dic[key]) as? String{
                
                setValue = keyValue as NSObject
            }else{
                
                 setValue = "" as NSObject
            }
            
            //利用KVC给本类的属性赋值
            self.setValue(setValue, forKey: nName)
            
        }
        
    }
    
    
    func attributesDic(dic:[String : AnyObject]) -> [String : AnyObject] {
        
        var newDic : [String : AnyObject] = [:]
        
        for key in dic.keys {
            //复写时注意将属性名作为key 数据字典的key作为value
            newDic[key] = key as AnyObject
        }
        return  newDic as [String : AnyObject]
    }

    
    /*
    //如果属性名与数据字典的key值不对应，那么在子类model中复写此方法，将属性名作为key，字典key值作为value
    func attributesDic(dic: [String:Any]) -> [String:String] {
        
        var newDic:[String:String] = [:]
     
        for key in dic.keys {
            //复写时注意将属性名作为key 数据字典的key作为value
            newDic[key] = key
        }
        
        return newDic
    }
     */
    

}









