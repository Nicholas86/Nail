//
//  MessageViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/26.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight + KTabBarHeight)), style: .plain)
        tableView.register(UINib.init(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "messageTableViewCell")
        tableView.rowHeight = 80
        tableView.indicatorStyle = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.hideTableFooterView()
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "消息"
        
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
extension MessageViewController  :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageTableViewCell", for: indexPath) as! MessageTableViewCell
        //cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
}




