//
//  UITextField+Extension.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/8.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func leftImageView() -> Void {
        let leftView: UIImageView = UIImageView(frame: CGRect.init(x: 30, y: 0, width: 30, height: 30))
        leftView.image = UIImage(named: "logo")
        /* 同上
         Never 不显示
         WhileEditing 编辑时才出现
         UnlessEditing 完成编辑后才出现
         Always 一直都显示
         */
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
}

