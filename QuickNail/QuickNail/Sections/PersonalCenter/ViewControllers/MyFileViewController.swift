//
//  MyFileViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/17.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class MyFileViewController: BaseViewController {

    lazy var tableView: UITableView = {
        
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight + 0)), style: .grouped)
        
        tableView.register(UINib.init(nibName: "MyFileTableViewCell", bundle: nil), forCellReuseIdentifier: "myFileTableViewCell")
        
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
        title = "我的文件"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func configurationBaseViews() {
        
        view.addSubview(tableView)
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
extension MyFileViewController  :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFileTableViewCell", for: indexPath) as! MyFileTableViewCell
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0.0001
        }
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.0001
    }
    
}


