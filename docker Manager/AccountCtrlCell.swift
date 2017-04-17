//
//  AccountCtrlCell.swift
//  docker Manager
//
//  Created by Developer on 17/04/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class AccountCtrlCell: UITableViewCell {

    @IBOutlet weak var addAccountButton: UIButton!
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addAccountButton.layer.backgroundColor = UIColor(red: 0x28/255, green: 0x60/255, blue: 0x90/255, alpha: 1).cgColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
