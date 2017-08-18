//
//  APPMacros.swift
//  SportsProduct
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 xiangguohe. All rights reserved.
//

import UIKit
/// 屏幕宽高
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let kRate = 1 / 375.0 * kScreenWidth
/// 颜色
let redColor = UIColor.red
let blackColor = UIColor.black
let blueColor = UIColor.blue
let brownColor = UIColor.brown
let clearColor = UIColor.clear
let darkGrayColor = UIColor.darkGray
let darkTextColor = UIColor.darkText
let whiteColor = UIColor.white
let yellowColor = UIColor.yellow
let orangeColor = UIColor.orange
let purpleColor = UIColor.purple
let lightGrayColor = UIColor.lightGray
let lightTextColor = UIColor.lightText
let greenColor = UIColor.green
let grayColor = UIColor.gray
let magentaColor = UIColor.magenta
//RGB
func RGBColor(_ r:CGFloat,g:CGFloat,b:CGFloat)-> UIColor{
    return(UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0))
}
//系统版本
let IOS7  = ( UIDevice.current.systemVersion as NSString).floatValue >= 7.0
//字体
let H30 = UIFont.systemFont(ofSize: 30)
let H29 = UIFont.systemFont(ofSize: 29)
let H28 = UIFont.systemFont(ofSize: 28)
let H27 = UIFont.systemFont(ofSize: 27)
let H26 = UIFont.systemFont(ofSize: 26)
let H25 = UIFont.systemFont(ofSize: 25)
let H24 = UIFont.systemFont(ofSize: 24)
let H23 = UIFont.systemFont(ofSize: 23)
let H22 = UIFont.systemFont(ofSize: 22)
let H21 = UIFont.systemFont(ofSize: 21)
let H20 = UIFont.systemFont(ofSize: 20)
let H19 = UIFont.systemFont(ofSize: 19)
let H18 = UIFont.systemFont(ofSize: 18)
let H17 = UIFont.systemFont(ofSize: 17)
let H16 = UIFont.systemFont(ofSize: 16)
let H15 = UIFont.systemFont(ofSize: 15)
let H14 = UIFont.systemFont(ofSize: 14)
let H13 = UIFont.systemFont(ofSize: 13)
let H12 = UIFont.systemFont(ofSize: 12)
let H11 = UIFont.systemFont(ofSize: 11)
let H10 = UIFont.systemFont(ofSize: 10)
let H9 = UIFont.systemFont(ofSize: 9)
let H8 = UIFont.systemFont(ofSize: 8)
//NSUserDefaults
let userDefaults = Foundation.UserDefaults.standard
//单例
let utilHelpSingleton = UtilHelpSingleton.shareUtilHelpSingleton
//图片
func ImageName(_ string : String)->UIImage?{
    return UIImage(named: string)
}
func urlImage(urlString : String) -> URL!{
    return   URL(string: urlString)!
}
//状态栏
var KStatusBarHeight = 20.0
//导航栏高
var KNavigationHeight  = 64.0
/// tabBar高
var KTabBarHeight = 44.0

//通知key
let notificationName = "notificationName"
let sortName = "sortName"
let cityNotificationName = "cityNotificationName"
let aliPayScheme = "sportsProductOnlin"
 //归档用户信息使用的key
let LoginUserInfoKey = "LoginUserInfoKey"
//全局单例
let userManagerSingleton = UserManangerSingleton.share()
//调取相机单例
let imagePickerSingleton = ImagePickerSingleton.share()
//成功标识
let errorCode : String = "0000"
//全局颜色主色调
let groupColor : UIColor = RGBColor(118, g: 178, b: 254)



