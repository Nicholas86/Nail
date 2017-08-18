//
//  ImagePickerViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/29.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIImagePickerController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //设置在相册选完照片后，是否跳到编辑模式进行图片剪裁。(允许用户编辑)
        self.allowsEditing = true
        
        self.sourceType = .photoLibrary
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




