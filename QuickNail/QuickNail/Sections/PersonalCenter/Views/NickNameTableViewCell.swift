//
//  NickNameTableViewCell.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/7.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class NickNameTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var nickNameLable: UILabel!
    
    @IBOutlet weak var realNameLabel: UILabel!
    
    @IBOutlet weak var sinalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
