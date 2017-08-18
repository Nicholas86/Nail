//
//  UIImage+Extension.swift
//  TaskElephant
//
//  Created by apple on 17/4/11.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit
extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        
        //let rect = CGRectMake(0, 0, size.width == 0 ? 1.0 : size.width, size.height == 0 ? 1.0 : size.height)
        let rect = CGRect.init(x: 0, y: 0, width: size.width == 0 ? 1.0 : size.width, height: size.height == 0 ? 1.0 : size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
    func resetImageSize(newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize.init(width: newWidth, height: newHeight))//CGSizeMake(newWidth, newHeight)
        self.draw(in: CGRect.init(x: 0, y: 0, width: newWidth, height: newHeight))//CGRectMake(0, 0, newWidth, newHeight)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    /*
     指定宽度等比缩放
     
     - parameter newWidth: 需要缩放的宽度
     
     - returns: 返回缩放后的图片
     */
    func equalScaleWithWidth(newWidth: CGFloat) -> CGSize {
        
        // 新的高度 / 新的宽度 = 原来的高度 / 原来的宽度
        let newHeight = newWidth * (size.height * scale) / (size.width * scale)
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        return newSize
        
    }
    
    /**
     指定高度等比缩放
     
     - parameter newHeight: 需要缩放的高度
     
     - returns: 返回缩放后的图片
     */
    func equalScaleWithWHeight(newHeight: CGFloat) -> CGSize {
        
        // 新的高度 / 新的宽度 = 原来的高度 / 原来的宽度
        let newWidth = newHeight / (size.height * scale) * (size.width * scale)
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        return newSize
        
    }
    
    /**
     缩放图片到指定的尺寸
     
     - parameter newSize: 需要缩放的尺寸
     
     - returns: 返回缩放后的图片
     */
    func resizeImageWithNewSize(newSize: CGSize) -> UIImage {
        
        var rect : CGRect = CGRect.init()
        let oldSize = self.size
        
        if newSize.width / newSize.height > oldSize.width / oldSize.height {
            rect.size.width = newSize.height * oldSize.width / oldSize.height
            rect.size.height = newSize.height
            rect.origin.x = (newSize.width - rect.size.width) * 0.5
            rect.origin.y = 0
        } else {
            rect.size.width = newSize.width
            rect.size.height = newSize.width * oldSize.height / oldSize.width
            rect.origin.x = 0
            rect.origin.y = (newSize.height - rect.size.height) * 0.5
        }
        
        UIGraphicsBeginImageContext(newSize)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.clear.cgColor)
        UIRectFill(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    /**
     等比例缩小, 缩小到宽度等于300
     - returns: 缩小的图片
     */
    func scaleImage() -> UIImage {
        
        var newWidth: CGFloat = 700
        
        if size.width < 400 {
            return self
        } else if size.width < 500 {
            newWidth = 500
        } else if size.width < 600 {
            newWidth = 600
        }
        
        // 等比例缩放
        // newHeight / newWidth = 原来的高度 / 原来的宽度
        let newHeight = newWidth * size.height / size.width
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        // 准备图片的上下文
        UIGraphicsBeginImageContext(newSize)
        
        // 将当前图片绘制到rect上面
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        // 从上下文获取绘制好的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭上下文
        UIGraphicsEndImageContext()
        
        return newImage!
    }

}

