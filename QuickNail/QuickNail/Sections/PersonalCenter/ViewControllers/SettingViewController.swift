//
//  SettingViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/26.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    lazy var titleArray :[String]  = {
        let titleArray = ["关于快叮","版本介绍","版本更新"]
        return titleArray
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height:150), style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.indicatorStyle = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.hideTableFooterView()
        return tableView
    }()
    
    lazy var logOutBtn: UIButton = {
        let logOutBtn = UIButton.init(type: UIButtonType.custom)
        logOutBtn.frame = CGRect.init(x:0, y: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight + KTabBarHeight), width: kScreenWidth, height: CGFloat(KTabBarHeight))
        logOutBtn.setTitle("退出登录", for: .normal)
        logOutBtn.backgroundColor = whiteColor
        logOutBtn.setTitleColor(RGBColor(128, g: 175, b: 230), for: .normal)
        logOutBtn.addTarget(self, action: #selector(handlelogOutBtn), for: .touchUpInside)
        return logOutBtn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "设置"
        view.addSubview(tableView)
        view.addSubview(logOutBtn)
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

//MARK:UITableViewDelegate
extension SettingViewController  :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let sb = UIStoryboard(name: "PersonalStoryboard", bundle: nil)
        
        //        if indexPath.row == 1 {
        //            let helpVC = sb.instantiateViewController(withIdentifier: "helpViewController") as! HelpViewController
        //            self.navigationController!.pushViewController(helpVC, animated: true)
        //        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}


//退出登录
extension SettingViewController {
    
    func handlelogOutBtn() -> Void {
        printLog(message: "退出登录")
        NSKeyedArchiverManager.loginOut()
        login()
    }

}


