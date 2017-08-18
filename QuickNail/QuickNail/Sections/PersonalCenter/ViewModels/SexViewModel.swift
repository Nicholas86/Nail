//
//  SexViewModel.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/10.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SexViewModel: NSObject {

    lazy var titleArray :[String] = {
        let titleArray = ["男","女"]
        return titleArray
    }()
    
    //1.保存选中行
    var markSelectCellRow = 0

    //2.监听传值
    var rx_sex : Variable<String> = Variable("")
    
    var sexString :String {  //改变sexString的值, rx_sex监听的值会发生改变
        get {
            return rx_sex.value
        }
        set{
            return rx_sex.value = newValue
        }
    }
    
    override init() {

    }
    
}

//MARK:UITableViewDelegate
extension SexViewModel :UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sexViewTableViewCell", for: indexPath) as! SexViewTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.rightImageView.isHidden = (indexPath.row == markSelectCellRow) ? false : true
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        markSelectCellRow = indexPath.row
        tableView.reloadData()
        //改变sexString的值,传值
        sexString = titleArray[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}




