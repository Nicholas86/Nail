//
//  UITableView+Extension.swift
//  TaskElephant
//
//  Created by apple on 17/4/11.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit

extension UITableView {
    
    func hideTableFooterView() {
        
        self.tableFooterView = UIView(frame: .zero)
        
    }
    
    func hideTableHeaderView() {
        
        self.tableHeaderView = UIView(frame: .zero)
        
    }
    
}



