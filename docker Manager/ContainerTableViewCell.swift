//
//  ContainerTableViewCell.swift
//  docker Manager
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblContainerStatus: UILabel!
    @IBOutlet weak var lblContainerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
