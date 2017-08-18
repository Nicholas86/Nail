//
//  BaseNavigationController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/3.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 导航栏（navigationbar）
        let rectNav = self.navigationBar.frame
        KNavigationHeight = Double(rectNav.size.height)
//        printLog(message: "导航栏nav height  高度- \(String(describing: rectNav.size.height))")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "leftbackicon_white_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: animated)

    }
    
    
    @objc private func navigationBack() {
        popViewController(animated: true)
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



