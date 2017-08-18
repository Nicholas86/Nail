//
//  BaseViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/26.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if IOS7 {
            self.edgesForExtendedLayout = .bottom
        }
        
        view.backgroundColor = RGBColor(241, g: 242, b: 243)
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        configurationBaseViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:初始化控件
    func configurationBaseViews() -> Void {
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}





