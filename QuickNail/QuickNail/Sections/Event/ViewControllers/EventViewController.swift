//
//  EventViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/26.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit
import SWRevealViewController

class EventViewController: BaseViewController {

    lazy var eventView: EventView = {
        let eventView = EventView.eventView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight + KTabBarHeight)))
        return eventView
    }()
    
    lazy var locationTracker: LocationTracker = {
        let locationTracker = LocationTracker()
        return locationTracker
    }()
    
    lazy var propertyDetailView: PropertyDetailView = {
        let propertyDetailView = PropertyDetailView(frame: self.view.bounds)
        return propertyDetailView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "事件"
        
        
        //let string = "lzwoaini"
        
        //printLog(message: "\(string.subString(from: 0, to: 3))")
        
        printLog(message: "EventViewController height  高度- \(CGFloat(KStatusBarHeight + KNavigationHeight + KTabBarHeight))")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func configurationBaseViews() {
        
        view.addSubview(eventView)
        
        //1.事件列表
        //view.addSubview(eventView)
        
        //2.侧滑导航栏
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(leftTarget: self, action: #selector(leftBarBtn))
//        addLeftBarMenu(leftMenuButton: UIBarButtonItem.init(leftTarget: self, action: #selector(leftBarBtn)))
        
        //3.定位 合适时机调用
        weak var weakeSelf = self
        

        self.locationTracker.getCurrentLocation(
            success: { (currentLocation) in
            
                DispatchQueue.main.async {
                   ShowMBProgressHUD.showAndDelayHideMBProgressHUD(view: (weakeSelf?.view)!, titleString: "当前定位城市:\(currentLocation)", delay: 2.0)
                }
                
        },fail: { (errorMessage) in
            
            printLog(message: "定位失败 \(errorMessage)")

        })
        
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

extension EventViewController{
    
    func leftBarBtn() -> Void {
        
        printLog(message: "左  侧滑")
    }
    
}



