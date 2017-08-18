//
//  PerInfoTableViewCell.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/8.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class PerInfoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var leftLabel: UILabel!
    
    
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
