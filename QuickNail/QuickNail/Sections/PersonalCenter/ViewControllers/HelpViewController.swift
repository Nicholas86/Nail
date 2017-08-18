//
//  HelpViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/7.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class HelpViewController: BaseViewController {

    lazy var titleArray :[String]  = {
        let titleArray = ["意见反馈","教程"]
        return titleArray
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight)), style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.indicatorStyle = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.hideTableFooterView()
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "帮助与反馈"
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
extension HelpViewController  :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "PersonalStoryboard", bundle: nil)
        
//        if indexPath.row == 1 {
//            let helpVC = sb.instantiateViewController(withIdentifier: "helpViewController") as! HelpViewController
//            self.navigationController!.pushViewController(helpVC, animated: true)
//        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
    
    
}



