
//
//  UIBarButtonItem+Extension.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/18.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// 侧滑
    convenience init(leftTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.custom)
//        btn.setImage(UIImage(named: "feed_signin"), for: UIControlState.normal)
        btn.setTitle("侧滑", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.backgroundColor = redColor
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.addTarget(leftTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }
    
    
    /// 返回
    convenience init(backTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "返回"), for: UIControlState.normal)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.addTarget(backTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }

    
    /// 搜索
    convenience init(searchTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "约搜索"), for: UIControlState.normal)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        btn.backgroundColor = redColor
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        btn.addTarget(searchTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }
    
    /// 选礼神器
    convenience init(chooseGifTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 260, y: 0, width: 60, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        btn.setTitle("选礼神器", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.addTarget(chooseGifTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }
    
    ///收藏
    convenience init(addCollectionTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        btn.setTitle("收藏", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.addTarget(addCollectionTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }
    
    ///创建活动
    convenience init(addActivityTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.setTitle("创建", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.addTarget(addActivityTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }
    
    ///添加银行卡
    convenience init(addBankTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.contactAdd)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        //'btn.setTitle("创建", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.addTarget(addBankTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }


    ///保存
    convenience init(saveTarget: AnyObject?, action: Selector){
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 0, y: 0, width: 48, height: 24)
        btn.backgroundColor = RGBColor(254, g: 194, b: 64)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        btn.setTitle("保存", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.addTarget(saveTarget, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }

}



