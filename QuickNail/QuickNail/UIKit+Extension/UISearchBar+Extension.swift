//
//  UISearchBar+Extension.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/18.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//


import UIKit

extension UISearchBar {
    
    convenience init(searchGifdelegate: UISearchBarDelegate, backgroundColor: UIColor, backgroundImage: UIImage) {
        self.init()
        delegate = searchGifdelegate
        placeholder = "快选一份礼物，送给亲爱的Ta吧"
        tintColor = UIColor.white
        barStyle = UIBarStyle.blackTranslucent
        layer.masksToBounds = true
        layer.cornerRadius = 5.0
        self.backgroundImage = backgroundImage
        for subView in subviews {
            for subView1 in subView.subviews {
//                if subView1.isKindOfClass(UITextField) {
//                    subView1.backgroundColor = backgroundColor
//                }
                if subView1.isEqual(UITextField.self) {
                    subView1.backgroundColor = backgroundColor
                }
            }
        }
    }
}

