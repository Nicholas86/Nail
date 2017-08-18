//
//  EventTableViewCell.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/4.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    //1.相框
    @IBOutlet weak var leftImageView: UIImageView!
    
    //2.标题
    @IBOutlet weak var titleLabel: UILabel!
    
    //3.时间
    @IBOutlet weak var timeLabel: UILabel!
    
    //4.免打扰图标
    @IBOutlet weak var NoDisturbImageView: UIImageView!
    
    //5.内容
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.leftImageView.layer.cornerRadius = 60 / 2
        self.leftImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}





