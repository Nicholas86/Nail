//
//  SexViewTableViewCell.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/10.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class SexViewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
