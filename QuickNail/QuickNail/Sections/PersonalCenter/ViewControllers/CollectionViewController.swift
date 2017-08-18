//
//  CollectionViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/12.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class CollectionViewController: BaseViewController {

    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - CGFloat(KStatusBarHeight + KNavigationHeight + 0)), style: .grouped)

        tableView.register(UINib.init(nibName: "CollectionOneTableViewCell", bundle: nil), forCellReuseIdentifier: "collectionOneTableViewCell")
    
        tableView.register(UINib.init(nibName: "CollectionTwoTableViewCell", bundle: nil), forCellReuseIdentifier: "collectionTwoTableViewCell")

        tableView.register(UINib.init(nibName: "CollectionThreeTableViewCell", bundle: nil), forCellReuseIdentifier: "collectionThreeTableViewCell")

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
        title = "我的收藏"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func configurationBaseViews() {
        
        view.addSubview(tableView)
    }

    
    
}


//MARK:UITableViewDelegate
extension CollectionViewController  :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionOneTableViewCell", for: indexPath) as! CollectionOneTableViewCell
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
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




