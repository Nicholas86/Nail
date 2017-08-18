//
//  BaseTabBarViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/26.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    lazy var eventNA: BaseNavigationController = {//UINavigationController
        let eventNA = self.addBaseChildViewController(childViewController: EventViewController(), title: "事件", normalImageName: "", selectImageName: "")
        return eventNA
    }()
    
    
    lazy var messageNA: BaseNavigationController = {
        let messageNA = self.addBaseChildViewController(childViewController: MessageViewController(), title: "消息", normalImageName: "", selectImageName: "")
        return messageNA
    }()
    
    lazy var contactNA: BaseNavigationController = {
        let contactNA = self.addBaseChildViewController(childViewController: ContactViewController(), title: "联系人", normalImageName: "", selectImageName: "")
        return contactNA
    }()
    
    lazy var personalNA: BaseNavigationController = {
        let personalNA = self.addBaseChildViewController(childViewController: PersonalViewController(), title: "个人中心", normalImageName: "", selectImageName: "")
        return personalNA
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadBaseTabBarViewController()
        
        // 底部（tabBar）
        let tabBar = self.tabBar.frame
        KTabBarHeight = Double(tabBar.size.height)
//        printLog(message: "底部tabBar height  高度- \(String(describing: tabBar.size.height))")
        
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
        // Pass the selected object to the new varw controller.
    }
    */

}


extension BaseTabBarViewController{
    
    func loadBaseTabBarViewController() -> Void {
        
        self.viewControllers = [eventNA,messageNA,contactNA,personalNA]
        
    }
    
}


extension BaseTabBarViewController{
    
    func addBaseChildViewController(childViewController : UIViewController,title : String,normalImageName: String, selectImageName : String) -> BaseNavigationController {//UINavigationController
        
        //默认状态图片
        let returnNavigationController = BaseNavigationController.init(rootViewController: childViewController)
        let image = ImageName(normalImageName)?.withRenderingMode(.alwaysOriginal)
        returnNavigationController.tabBarItem.image = image
        
        //选中状态图片
        let imageView = ImageName(selectImageName)?.withRenderingMode(.alwaysOriginal)
        returnNavigationController.tabBarItem.selectedImage = imageView
        
        returnNavigationController.title = title
        
        //默认字体颜色、大小
        returnNavigationController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:RGBColor(51, g: 51, b: 51),NSFontAttributeName:UIFont.init(name: "Helvetica", size: 13.0)!], for: .normal)
        //选中字体颜色、大小
        returnNavigationController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:RGBColor(254, g: 194, b: 64),NSFontAttributeName:UIFont.init(name: "Helvetica", size: 13.0)!], for: .selected)
        
        return returnNavigationController;

    }
    
}




