//
//  MessageTableViewCell.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/12.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLABLE: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var timeLanel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.leftImageView.layer.cornerRadius = 60 / 2
        self.leftImageView.layer.masksToBounds = true
        
        self.numberLABLE.layer.cornerRadius = 20 / 2
        self.numberLABLE.layer.masksToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}




