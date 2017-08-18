//
//  CollectionOneTableViewCell.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/12.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class CollectionOneTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var midImageView: UIImageView!
    
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
