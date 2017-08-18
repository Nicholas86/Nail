//
//  PersonalViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/26.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class PersonalViewController: BaseViewController {

    lazy var titleArray :[String]  = {
        let titleArray = ["我的积分","我的收藏","我的二维码名片","我的文件","企业认证"]
        return titleArray
    }()
    
    lazy var threeTitleArray :[String]  = {
        let threeTitleArray = ["增值服务","帮助与反馈","设置"]
        return threeTitleArray
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight + KTabBarHeight)), style: .grouped)
        //第一分区
        tableView.register(UINib.init(nibName: "NickNameTableViewCell", bundle: nil), forCellReuseIdentifier: "nickNameTableViewCell")
        //第二分区
        tableView.register(UINib.init(nibName: "TwoTableViewCell", bundle: nil), forCellReuseIdentifier: "twoTableViewCell")
        tableView.indicatorStyle = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.hideTableFooterView()
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.tabBarController?.hidesBottomBarWhenPushed = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "个人中心"
        
        view.addSubview(self.tableView)
        
        /*
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 100.0, y: 200.0, width: 100.0, height: 35.0)
        btn.backgroundColor = redColor
        btn.addTarget(self, action: #selector(handleBtn), for: .touchUpInside)
        view.addSubview(btn)
        */
        
        //初始化相机控制器
        //imagePickerSingleton.mainVC = self
        //imagePickerSingleton.imageBlock = reveiverImageBlock(image:)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleBtn() -> Void {
        
        //imagePickerSingleton.presentViewController()
        
    }
    
   
}

//MARK:UITableViewDelegate
extension PersonalViewController  :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section ==  0{
            return 1
        }else if(section == 1){
            return 5
        }else{
            return 3
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nickNameTableViewCell", for: indexPath) as! NickNameTableViewCell
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }else if (indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "twoTableViewCell", for: indexPath) as! TwoTableViewCell
            cell.titleLabel.text = titleArray[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            cell.authLabel.isHidden = indexPath.row == 4 ? false : true
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "twoTableViewCell", for: indexPath) as! TwoTableViewCell
            cell.titleLabel.text = threeTitleArray[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            cell.authLabel.isHidden = true
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            
            let perInfoVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "perInfoViewController") as! PerInfoViewController
            navigationController?.pushViewController(perInfoVC, animated: true)
            
        }else if (indexPath.section == 1){
            
            if(indexPath.row == 0){
                let integralVCVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "integralViewController") as! IntegralViewController
                navigationController?.pushViewController(integralVCVC, animated: true)
            }
            if indexPath.row == 1 {
                let collectVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "collectionViewController") as! CollectionViewController
                navigationController?.pushViewController(collectVC, animated: true)
            }else if (indexPath.row == 2){
                let erCodeVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "erCodeViewController") as! ErCodeViewController
                navigationController?.pushViewController(erCodeVC, animated: true)
            }else if (indexPath.row == 3){
                let myFileVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "myFileViewController") as! MyFileViewController
                navigationController?.pushViewController(myFileVC, animated: true)
            }
            
        }else{
            if indexPath.row == 1 {
                
            let helpVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "helpViewController") as! HelpViewController
            self.navigationController!.pushViewController(helpVC, animated: true)
                
            }else if (indexPath.row == 2){
                let settingVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "settingViewController") as! SettingViewController
                self.navigationController!.pushViewController(settingVC, animated: true)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 100
        }else {
            
            return 50
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.001
    }
    
    
}


extension PersonalViewController{
    
//    func reveiverImageBlock(image : UIImage) -> Void {
//        self.imageView.image = image
//    }
    
}




