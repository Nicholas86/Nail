//
//  PerInfoViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/8.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class PerInfoViewController: BaseViewController {

    lazy var titleArray :[String] = {
        let titleArray = ["昵称","签名","真实姓名","手机号","邮箱","生日","性别","星座","兴趣爱好","行业","地区"]
        return titleArray
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight)), style: .plain)
        tableView.register(UINib.init(nibName: "PerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "perInfoTableViewCell")
        tableView.indicatorStyle = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.hideTableFooterView()
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "个人资料"
        view.addSubview(tableView)
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
extension PerInfoViewController  :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 11
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "perInfoTableViewCell", for: indexPath) as! PerInfoTableViewCell
        cell.selectionStyle = .none
        cell.leftLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            let nickNameVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "nickNameViewController") as! NickNameViewController
            nickNameVC.nickNameVCType = .nickName //昵称
            navigationController?.pushViewController(nickNameVC, animated: true)
        }else if (indexPath.row == 1){
            let signalVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "signalViewController") as! SignalViewController
            navigationController?.pushViewController(signalVC, animated: true)
        }else if (indexPath.row == 2){
            let nickNameVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "nickNameViewController") as! NickNameViewController
            nickNameVC.nickNameVCType = .realName //真实姓名
            navigationController?.pushViewController(nickNameVC, animated: true)
        }else if (indexPath.row == 3){
            let nickNameVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "nickNameViewController") as! NickNameViewController
            nickNameVC.nickNameVCType = .phoneNumber //手机号
            navigationController?.pushViewController(nickNameVC, animated: true)
        }else if (indexPath.row == 4){
            let nickNameVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "nickNameViewController") as! NickNameViewController
            nickNameVC.nickNameVCType = .email //邮箱
            navigationController?.pushViewController(nickNameVC, animated: true)
        }else if (indexPath.row == 5){
            
            
        }else if (indexPath.row == 6){//性别
            let sexVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "sexViewController") as! SexViewController
            sexVC.sexVCType = .sex
            navigationController?.pushViewController(sexVC, animated: true)
        }else if (indexPath.row == 7){//星座
            let sexVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "sexViewController") as! SexViewController
            sexVC.sexVCType = .star
            navigationController?.pushViewController(sexVC, animated: true)
        }else if (indexPath.row == 8){//爱好
            let sexVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "sexViewController") as! SexViewController
            sexVC.sexVCType = .hobbit
            navigationController?.pushViewController(sexVC, animated: true)
        }else if (indexPath.row == 9){//行业
            let sexVC = viewControllerFromStoryboar(storboordName: "PersonalStoryboard", storboardControllerIdentifier: "sexViewController") as! SexViewController
            sexVC.sexVCType = .industry
            navigationController?.pushViewController(sexVC, animated: true)
        }

    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}


