//
//  AccountTableViewCell.swift
//  docker Manager
//
//  Created by Developer on 17/04/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    @IBOutlet weak var lblAccountName: UILabel!

    @IBOutlet weak var lblAccountUrl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func update(name: String?, url: String?) {
        if (name != nil) {
            lblAccountName.text = name!
        }
        
        if(url != nil){
            lblAccountUrl.text = url!
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
