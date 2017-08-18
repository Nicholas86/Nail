//
//  MyFileTableViewCell.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/17.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class MyFileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fileSizeLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
