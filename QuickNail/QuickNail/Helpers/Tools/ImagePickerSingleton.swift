//
//  ImagePickerSingleton.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/29.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

//block传值UIImage
typealias ImageBlock = (_ pickerImage:UIImage) ->Void

class ImagePickerSingleton: NSObject{

    //接收控制器
    var mainVC : UIViewController = UIViewController()
    
    /*
    var mainVC = UIViewController() {
        didSet{
            presentViewController(viewController: mainVC)
        }
    }
     */
    
    lazy var imagePickerVC: ImagePickerViewController = {
        let imagePickerVC = ImagePickerViewController()
        return imagePickerVC
    }()

    var imageBlock : ImageBlock?

    //创建单例
    private static  var instance : ImagePickerSingleton! = nil
    
    static func share() -> ImagePickerSingleton {
        if instance == nil {
            instance = ImagePickerSingleton()
        }
        return instance
    }
    
    //私有初始化
    private override init() {
        super.init()
        imagePickerVC.delegate = self
    }

}


//调取相机
extension ImagePickerSingleton{
    
    func presentViewController() -> Void {
        mainVC.present(self.imagePickerVC, animated: true, completion: nil)
    }
    
}

//MARK:UIImagePickerControllerDelegate
extension ImagePickerSingleton : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
         // 关闭图片选择界面
        picker.dismiss(animated: true, completion: nil)
        
        let image : UIImage = info[UIImagePickerControllerEditedImage] as! UIImage

        if self.imageBlock != nil{
           self.imageBlock!(image)
        }
        
    }
    
}






