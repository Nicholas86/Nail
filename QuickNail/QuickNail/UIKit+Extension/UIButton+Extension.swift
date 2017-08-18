//
//  UIButton+Extension.swift
//  SportsProduct
//
//  Created by apple on 17/3/31.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit
// 默认间隔时间
fileprivate let defaultDuration = 1.0

extension UIButton {
    
    private struct AssociatedKeys {
        static var clickDurationTime = "my_clickDurationTime"
        static var isIgnoreEvent = "my_isIgnoreEvent"
    }
    
    // 点击间隔时间
    var clickDurationTime : TimeInterval {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.clickDurationTime, newValue as TimeInterval, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            
            if let clickDurationTime = objc_getAssociatedObject(self, &AssociatedKeys.clickDurationTime) as? TimeInterval {
                return clickDurationTime
            }
            
            return defaultDuration
        }
    }
    
    // 是否忽视点击事件
    var isIgnoreEvent : Bool {
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isIgnoreEvent, newValue as Bool, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            
            if let isIgnoreEvent = objc_getAssociatedObject(self, &AssociatedKeys.isIgnoreEvent) as? Bool {
                return isIgnoreEvent
            }
            
            return false
        }
    }
    
    override open class func initialize() {
        struct Static {
            static var token: String = "com.pilgrim.ButtonExtension"
        }

        
        if self !== UIButton.self {
            return
        }
        
        let originalSelector = #selector(UIButton.sendAction(_:to:for:))
        let swizzledSelector = #selector(UIButton.my_sendAction(action:to:forEvent:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        // 运行时为类添加我们自己写的my_sendAction(_:to:forEvent:)
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            // 如果添加成功，则交换方法
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            // 如果添加失败，则交换方法的具体实现
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }

        /*
        DispatchQueue.zone(token: Static.token, block: {
            
            let originalSelector = #selector(UIButton.sendAction(_:to:for:))
            let swizzledSelector = #selector(UIButton.my_sendAction(action:to:forEvent:))
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            // 运行时为类添加我们自己写的my_sendAction(_:to:forEvent:)
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                // 如果添加成功，则交换方法
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                // 如果添加失败，则交换方法的具体实现
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        })
 */
    }
    
    
    // SwizzledMethod
    @objc func my_sendAction(action: Selector, to target: AnyObject?, forEvent event: UIEvent?) {
        
        if self.isKind(of: UIButton.self) {
            
            clickDurationTime = clickDurationTime == 0 ? defaultDuration : clickDurationTime
            
            if isIgnoreEvent {
                return
            } else if clickDurationTime > 0 {
                isIgnoreEvent = true
                // 在过了我们设置的duration之后，再将isIgnoreEvent置为false
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + clickDurationTime, execute: {
                    self.isIgnoreEvent = false
                })
                
                my_sendAction(action: action, to: target, forEvent: event)
            }
        } else {
            my_sendAction(action: action, to: target, forEvent: event)
        }
    }
    
    /// 导航栏排序按钮
    convenience init(sortTarget: AnyObject?, action: Selector) {
        self.init()
        frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        setImage(UIImage(named: "icon_sort"), for: UIControlState.normal)
        addTarget(sortTarget, action: action, for: UIControlEvents.touchUpInside)
    }
    
    /// 导航栏返回按钮
    convenience init(backTarget: AnyObject?, action: Selector) {
        self.init()
        setImage(UIImage(named: "back"), for: UIControlState.normal)
        frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        addTarget(backTarget, action: action, for: UIControlEvents.touchUpInside)
    }
    
    /// 导航栏取消按钮
    convenience init(cancelTarget: AnyObject?, action: Selector) {
        self.init()
        setTitle("取消", for: UIControlState.normal)
        frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        addTarget(cancelTarget, action: action, for: UIControlEvents.touchUpInside)
    }
    
    /// 选礼神器-筛选标签按钮
    convenience init(srotTagTarget: AnyObject?, action: Selector) {
        self.init()
        setBackgroundImage(UIImage.imageWithColor(color: UIColor.white, size: CGSize.init(width: 1, height: 1)), for: UIControlState.normal)//1, 1
        setBackgroundImage(UIImage.imageWithColor(color: UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0), size: CGSize.init(width: 1, height: 1)), for: UIControlState.selected)
        setBackgroundImage(UIImage.imageWithColor(color: UIColor.red, size: CGSize.init(width: 1, height: 1)), for: UIControlState.highlighted)
        setTitleColor(UIColor (red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0), for: UIControlState.normal)
        setTitleColor(UIColor.white, for: UIControlState.selected)
        setTitleColor(UIColor.white, for: UIControlState.highlighted)
        titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        layer.masksToBounds = true
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor (red: 223.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, alpha: 1.0).cgColor
        layer.borderWidth = 0.5
        addTarget(srotTagTarget, action: action, for: UIControlEvents.touchUpInside)
    }

}


















