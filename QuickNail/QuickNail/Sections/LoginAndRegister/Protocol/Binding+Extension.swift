//
//  Binding+Extension.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/10.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

extension ValidationResult: CustomStringConvertible {
    var description: String {
        switch self {
        case let .ok(message):
            return message
        case .empty:
            return ""
        case .validating:
            return "validating ..."
        case let .failed(message):
            return message
        }
    }
}

struct ValidationColors {
    static let okColor = UIColor(red: 138.0 / 255.0, green: 221.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
    static let errorColor = UIColor.red
}

extension ValidationResult {
    var textColor: UIColor {
        switch self {
        case .ok:
            return ValidationColors.okColor
        case .empty:
            return UIColor.black
        case .validating:
            return UIColor.black
        case .failed:
            return ValidationColors.errorColor
        }
    }
}


// label 展示验证后的结果

extension Reactive where Base: UILabel {
    var validationResult: UIBindingObserver<Base, ValidationResult> {
        return UIBindingObserver(UIElement: base) { label, result in
            label.textColor = result.textColor
            label.text = result.description
        }
    }
}



// MARK: RX 扩展 计算型属性
// textfield 展示验证后的结果能否输入，验证过了才能输入
extension Reactive where Base: UITextField {
    
    var inputEnable: UIBindingObserver<Base, ValidationResult> {
        return UIBindingObserver(UIElement: base,
                                 binding: { (textField, result) in
            textField.isEnabled = result.isValid
        })
    }
    
}

