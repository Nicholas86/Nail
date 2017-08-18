//
//  EventView.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/4.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class EventView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //搜索框
    lazy var searchController: UISearchController = {
        let searchController = UISearchController.init(searchResultsController: nil)
        searchController.searchBar.barTintColor = RGBColor(242, g: 242, b: 242)
        //去掉上下黑线
        searchController.searchBar.backgroundImage = UIImage.init()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "搜索"
        searchController.disablesAutomaticKeyboardDismissal = false
        searchController.searchBar.delegate = self as UISearchBarDelegate
        searchController.searchBar.sizeToFit()
        //去掉灰色蒙版
        searchController.dimsBackgroundDuringPresentation = false
        //禁止视图上移
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.showsCancelButton = false
        return searchController
    }()
    
    
    //tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), style: .grouped)
        tableView.register(UINib.init(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "eventTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.indicatorStyle = .black
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //fatalError("断言")
        addSubview(tableView)
        tableView.backgroundView = UIImageView.init(image: ImageName("logo"))
        tableView.tableHeaderView = searchController.searchBar
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}


//MARK:UITableViewDataSource,UITableViewDelegate

extension EventView : UITableViewDataSource,UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventTableViewCell", for: indexPath) as! EventTableViewCell
        
        cell.titleLabel.text = "标题"
        
        return cell
    }
    
    
    //每个分区页眉
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    //每个分区页脚
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    
}

//MARK:UISearchControllerDelegate,
extension EventView : UISearchBarDelegate{
    
    //允许编辑
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        searchBar.setShowsCancelButton(true, animated: true)
        let button : UIButton = searchBar.value(forKey: "cancelButton") as! UIButton
        button.setTitle("取消", for: .normal)
        /*
        for obj in searchBar.subviews {
            if obj.isKind(of: UIView.self) {
                for obj2 in obj.subviews {
                    if obj2.isKind(of: UIButton.self) {
                        let btn : UIButton = obj2 as! UIButton
                        btn.setTitle("取消", for: .normal)
                    }
                }
            }
        }
         */
        return true
    }
    
    
    
    //开始编辑
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    
        printLog(message: "刚开始搜索")
    }
    
    //取消按钮
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        printLog(message: "取消按钮")
    }
    
    //搜索按钮
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        printLog(message: "搜索按钮")
    }
    
}

//MARK:UISearchResultsUpdating
extension EventView : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        printLog(message: "更新搜索结果")
    }
    
}


//返回对象
extension EventView{
    
    class func eventView(frame:CGRect) -> EventView {
        
        let eventView = EventView.init(frame: frame)
        
        return eventView
    }
    
}


