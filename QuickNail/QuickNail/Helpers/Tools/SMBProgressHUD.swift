//
//  SMBProgressHUD.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/28.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

import MBProgressHUD

class SMBProgressHUD: NSObject {

    //提示框,定义类型
    var mBProgressHUD : MBProgressHUD?
    
    //创建单例
    static let share = SMBProgressHUD()
    
    //私有化初始化
    fileprivate override init() {}
    
    
    //MARK: 初始化加载视图
    private func creatMBProgressHUD(view : UIView) -> MBProgressHUD{
        if mBProgressHUD == nil {
            //    HUD.mode = MBProgressHUDModeIndeterminate;//菊花，默认值
            //    HUD.mode = MBProgressHUDModeDeterminate;//圆饼，饼状图
            //    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;//进度条
            //    HUD.mode = MBProgressHUDModeAnnularDeterminate;//圆环作为进度条
            //    HUD.mode = MBProgressHUDModeCustomView; //需要设置自定义视图时候设置成这个
            //    HUD.mode = MBProgressHUDModeText; //只显示文本
            
            mBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
            mBProgressHUD!.mode = .text
            let cgFloat : CGFloat = (kScreenHeight - 64) / 2 - 300
            mBProgressHUD!.offset.y = cgFloat
            mBProgressHUD!.label.font = H16
            mBProgressHUD!.minSize = CGSize(width: 100, height: 25)
            mBProgressHUD!.removeFromSuperViewOnHide = true
            mBProgressHUD!.label.textColor = whiteColor
            mBProgressHUD!.bezelView.color = blackColor
            //mBProgressHUD!.backgroundView.style = .Blur //或SolidColor
        }
        return mBProgressHUD!
    }

    
    //显示加载视图
    func showMBProgressWithViewAndTitleString(view: UIView,title: String) -> Void {
        
        mBProgressHUD = creatMBProgressHUD(view: view)
        
        if title.characters.count == 0 {
            mBProgressHUD?.label.text = "请稍后"
        }
        
        mBProgressHUD?.label.text = title as String
    }
    
    
    //MARK:隐藏加载视图
    func hideMBProgress() -> Void {
        if mBProgressHUD != nil {
            mBProgressHUD!.removeFromSuperview()
            mBProgressHUD = nil
        }
    }

    
    //MARK:延迟加载、隐藏视图
    func showMBProgressAndDelayHideMBProgressHUD(view: UIView,title: String,delay : TimeInterval) -> Void {
        showMBProgressWithViewAndTitleString(view: view, title: title)
        mBProgressHUD!.hide(animated: true, afterDelay: 0.5)
        mBProgressHUD = nil
    }

    
}








